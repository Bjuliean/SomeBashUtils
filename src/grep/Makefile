GCC=gcc -Wall -Wextra -Werror s21_grep.c -o s21_grep

.PHONY:s21_grep

all: s21_grep

s21_grep:
	$(GCC)

rebuild:
	rm s21_grep && $(GCC)
	
clean:
	rm s21_grep
