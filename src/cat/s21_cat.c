#include "s21_cat.h"

int main(int argc, char **argv) {
  struct optionList options = {0, 0, 0, 0, 0, 0, 0, 0};

  parser(argc, argv, &options);
}

void catOptionN(char prevSymb, int *lineCounter) {
  if (*lineCounter == 1) {
    printf("%6d\t", *lineCounter);
    *lineCounter = *lineCounter + 1;
  }
  if (prevSymb == '\n') {
    printf("%6d\t", *lineCounter);
    *lineCounter = *lineCounter + 1;
  }
}

void catOptionB(char symb, char prevSymb, int *lineCounterB) {
  if (*lineCounterB == 1 && symb != '\n') {
    printf("%6d\t", *lineCounterB);
    *lineCounterB = *lineCounterB + 1;
  }
  if (symb != '\n' && prevSymb == '\n') {
    printf("%6d\t", *lineCounterB);
    *lineCounterB = *lineCounterB + 1;
  }
}

void catOptionS(char symb, char prevSymb, char prePrevSymb, int *optionCheckerS,
                int iterS) {
  if (symb == '\n' && prevSymb == '\n' && prePrevSymb == '\n')
    *optionCheckerS = 1;
  if (iterS < 2 && (symb == '\n' || prevSymb == '\n')) *optionCheckerS = 1;
}

void catOptionV(char *symb) {
  if (*symb >= 0 && *symb <= 32 && *symb != '\n' && *symb != '\t' &&
      *symb != ' ' && *symb != EOF) {
    printf("^");
    *symb = *symb + 64;
  }
  if (*symb == 127) {
    printf("^");
    *symb = '?';
  }
}

void catOptionE(char symb) {
  if (symb == '\n') printf("$");
}

void catOptionT(char *symb) {
  if (*symb == '\t') {
    printf("^");
    *symb = 'I';
  }
}

void readFile(char *file, struct optionList *options) {
  FILE *fp = fopen(file, "r");
  char symb = 0, prevSymb = 0, prePrevSymb = 0;
  int lineCounter = 1, lineCounterB = 1;
  int optionCheckerS = 0, iterS = 0;
  if (fp != NULL) {
    while (symb != EOF) {
      symb = fgetc(fp);
      if (symb != EOF) {
        if (options->optB == 1) {
          catOptionB(symb, prevSymb, &lineCounterB);
        }
        if (options->optS == 1) {
          catOptionS(prePrevSymb, prevSymb, symb, &optionCheckerS, iterS);
          iterS++;
        }
        if (options->optEGNU == 1) {
          catOptionE(symb);
        }
        if (options->optTGNU == 1) {
          catOptionT(&symb);
        }
        if (options->optN == 1 && options->optB == 0) {
          if (options->optS == 1) {
            if (optionCheckerS == 0) {
              catOptionN(prevSymb, &lineCounter);
              if (options->optE == 1 || options->optT == 1) catOptionV(&symb);
            }
          } else {
            catOptionN(prevSymb, &lineCounter);
            if (options->optE == 1 || options->optT == 1) catOptionV(&symb);
          }
        }
        if (options->optV == 1) {
          catOptionV(&symb);
        }
        if (options->optE == 1) {
          if (options->optS == 1) {
            if (optionCheckerS == 0) {
              catOptionE(symb);
              if (options->optN == 0 ||
                  (options->optN == 1 && options->optB == 1))
                catOptionV(&symb);
            }
          } else {
            catOptionE(symb);
            if (options->optN == 0 ||
                (options->optN == 1 && options->optB == 1))
              catOptionV(&symb);
          }
        }
        if (options->optT == 1) {
          catOptionT(&symb);
          if (options->optN == 0 || (options->optN == 1 && options->optB == 1))
            catOptionV(&symb);
        }

        if (optionCheckerS == 0) printf("%c", symb);
      }
      prePrevSymb = prevSymb;
      prevSymb = symb;
      optionCheckerS = 0;
    }
    fclose(fp);
  } else {
    printf("cat: %s: No such file or directory\n", file);
  }
}

void checkOptions(char *bufferOptions, struct optionList *options) {
  for (size_t i = 0; i < strlen(bufferOptions); i++) {
    switch (bufferOptions[i]) {
      case 'b':
        options->optB = 1;
        break;
      case 'e':
        options->optE = 1;
        break;
      case 'n':
        options->optN = 1;
        break;
      case 's':
        options->optS = 1;
        break;
      case 't':
        options->optT = 1;
        break;
      case 'v':
        options->optV = 1;
        break;
      case 'E':
        options->optEGNU = 1;
        break;
      case 'T':
        options->optTGNU = 1;
        break;
    }
  }
}

void checkLongOptions(char *bufferLongOptions, struct optionList *options) {
  if (strcmp(bufferLongOptions, "number") == 0) options->optN = 1;
  if (strcmp(bufferLongOptions, "number-nonblank") == 0) options->optB = 1;
  if (strcmp(bufferLongOptions, "squeeze-blank") == 0) options->optS = 1;
}

void parser(int argc, char **argv, struct optionList *options) {
  char bufferOptions[BUFFSIZE] = {0};
  char bufferLongOptions[BUFFSIZE] = {0};

  int optionArrCounter = 0, longOptionArrCounter = 0;

  for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '-' && argv[i][1] != '-') {
      for (size_t z = 1; z < strlen(argv[i]); z++) {
        bufferOptions[optionArrCounter] = argv[i][z];
        optionArrCounter++;
      }
    }
  }
  checkOptions(bufferOptions, options);
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '-' && argv[i][1] == '-') {
      longOptionArrCounter = 0;
      for (size_t z = 2; z < strlen(argv[i]); z++) {
        bufferLongOptions[longOptionArrCounter] = argv[i][z];
        longOptionArrCounter++;
      }
      bufferLongOptions[longOptionArrCounter] = '\0';
      checkLongOptions(bufferLongOptions, options);
      memset(bufferLongOptions, 0, BUFFSIZE);
    }
  }
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] != '-') {
      readFile(argv[i], options);
    }
  }
}