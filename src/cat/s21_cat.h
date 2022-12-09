#ifndef SRC_CAT_S21_CAT_H_
#define SRC_CAT_S21_CAT_H_

#include <stdio.h>
#include <string.h>

#define BUFFSIZE 250

struct optionList {
  int optB;
  int optE;
  int optN;
  int optS;
  int optT;
  int optV;
  int optEGNU;
  int optTGNU;
};

void parser(int argc, char **argv, struct optionList *options);
void checkOptions(char *bufferOptions, struct optionList *options);
void checkLongOptions(char *bufferLongOptions, struct optionList *options);
void catOptionB(char symb, char prevSymb, int *lineCounterB);
void catOptionN(char prevSymb, int *lineCounter);
void catOptionS(char symb, char prevSymb, char prePrevSymb, int *optionCheckerS,
                int iterS);
void catOptionV(char *symb);
void catOptionE(char symb);
void catOptionT(char *symb);

#endif  // SRC_CAT_S21_CAT_H_