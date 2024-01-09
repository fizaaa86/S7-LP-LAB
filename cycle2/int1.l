%{
#include <stdio.h>
int count_bbb = 0;
int count_4_digit_numbers = 0;
int count_words_with_one_a = 0;
int count_words_no_a_length_5 = 0;
%}

%%
(a|b)*bbb(a|b)*      {count_bbb++;}
^[0-9][0-9][0-9][0-9]$   {count_4_digit_numbers++;}
[a-zA-Z]+   {
    int count_a = 0;
    for(int i = 0; i < yyleng; i++) {
        if(yytext[i] == 'a') {
            count_a++;
        }
    }
    if(count_a == 1) {
        count_words_with_one_a++;
    }
    if(count_a == 0 && yyleng == 5) {
        count_words_no_a_length_5++;
    }
}
.           {}

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");

    if (!file) {
        perror("Error opening file");
        return 1;
    }

    yyin = file;

    yylex();

    printf("1. No. of Strings with substring bbb: %d\n", count_bbb);
    printf("2. Count of 4 digit numbers: %d\n", count_4_digit_numbers);
    printf("3. No. of words with exactly 1 'a': %d\n", count_words_with_one_a);
    printf("4. No. of words with no 'a' and length = 5: %d\n", count_words_no_a_length_5);

    fclose(file);

    return 0;
}

