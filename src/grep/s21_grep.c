#define _GNU_SOURCE

#include "s21_grep.h"

int main(int argc, char **argv) {
  struct optionList options = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  char patternsBuffer[BUFFSIZE] = {0};
  int totalPatterns = 0;
  if (argc < 3) {
    fprintf(stderr, "grep [options] template [file_name]\n");
  } else {
    parser(argc, argv, patternsBuffer, &totalPatterns, &options);
    optimizingFlags(&options);
    if (totalPatterns == 0) addPatternDefault(patternsBuffer, argv);
    if (compilePatterns(patternsBuffer, &options) == 1 && options.err == 0) {
      readFile(argc, argv, &options);
      regfree(&re);
    } else {
      fprintf(stderr,
              "Error: Can't compile patterns or printed invalid flags\n");
    }
  }

  return 0;
}

void optimizingFlags(struct optionList *options) {
  if (options->optC == 1 || options->optL == 1 || options->optV == 1)
    options->optO = 0;
}

void outputOnlyMatchesCounter(char *currentFile, int totalFiles,
                              int matchCounter, struct optionList *options) {
  if (options->optC == 1 && options->optL == 1 && matchCounter > 0)
    matchCounter = 1;
  if (totalFiles > 1 && options->optH == 0 && options->optC == 1)
    printf("%s:%d\n", currentFile, matchCounter);
  if ((totalFiles == 1 || options->optH == 1) && options->optC == 1)
    printf("%d\n", matchCounter);
  if (options->optL == 1 && matchCounter > 0) printf("%s\n", currentFile);
}

void outputWithO(char *buffer, char *currentFile, int totalFiles,
                 int lineCounter, struct optionList *options) {
  char *tempBufferO = buffer;
  int cycleO = 0;
  int regRes = 0;
  while (regRes == 0) {
    if (cycleO == 0)
      output(buffer, currentFile, totalFiles, lineCounter, options);
    for (int i = pmatch[0].rm_so; i < pmatch[0].rm_eo; i++)
      putchar(tempBufferO[i]);
    printf("\n");
    tempBufferO = tempBufferO + pmatch[0].rm_eo;
    regRes = regexec(&re, tempBufferO, 1, pmatch, 0);
    cycleO++;
  }
}

void output(char *buffer, char *currentFile, int totalFiles, int lineCounter,
            struct optionList *options) {
  if (totalFiles > 1 && options->optH == 0) printf("%s:", currentFile);
  if (options->optN == 1) printf("%d:", lineCounter);
  if (options->optO == 0) printf("%s", buffer);
}

void checkForSpace(char *buffer, int lineCounter, int lastLineCounter,
                   struct optionList *options) {
  if (lineCounter == lastLineCounter && buffer[strlen(buffer) - 1] != '\n' &&
      options->optL == 0 && options->optC == 0 && options->optO == 0)
    printf("\n");
}

void readFile(int argc, char **argv, struct optionList *options) {
  FILE *fp = NULL;
  int totalFiles = argc - optind;
  int regCheckRes = 0;
  int lineCounter = 1;
  int lastLineCounter = 1;
  int matchCounter = 0;
  char buffer[BUFFSIZE] = {0};
  for (; optind < argc; optind++) {
    lineCounter = 1;
    lastLineCounter = 1;
    matchCounter = 0;
    if ((fp = fopen(argv[optind], "r")) != NULL) {
      while (fgets(buffer, BUFFSIZE, fp) != NULL) {
        regCheckRes = regexec(&re, buffer, 1, pmatch, 0);
        if (options->optV == 0) {
          if (regCheckRes == 0) {
            matchCounter++;
            if (options->optC == 0 && options->optL == 0) {
              if (options->optO == 0)
                output(buffer, argv[optind], totalFiles, lineCounter, options);
              else
                outputWithO(buffer, argv[optind], totalFiles, lineCounter,
                            options);
              lastLineCounter = lineCounter;
            }
          }
        }
        if (options->optV == 1) {
          if (regCheckRes == REG_NOMATCH) {
            matchCounter++;
            if (options->optC == 0 && options->optL == 0) {
              if (options->optO == 0)
                output(buffer, argv[optind], totalFiles, lineCounter, options);
              else
                outputWithO(buffer, argv[optind], totalFiles, lineCounter,
                            options);
              lastLineCounter = lineCounter;
            }
          }
        }
        lineCounter++;
      }
      if (options->optC == 1 || options->optL == 1)
        outputOnlyMatchesCounter(argv[optind], totalFiles, matchCounter,
                                 options);
      else
        checkForSpace(buffer, lineCounter, lastLineCounter + 1, options);
      fclose(fp);
    } else if (options->optS == 0) {
      fprintf(stderr, "grep: %s: No such file or directory\n", argv[optind]);
    }
  }
}

void addPatternDefault(char *patternsBuffer, char **argv) {
  strcat(patternsBuffer, argv[optind]);
  optind++;
}

int compilePatterns(char *patternsBuffer, struct optionList *options) {
  int compileResult = 0;
  int regFlags = REG_EXTENDED;
  if (options->optI == 1) regFlags += REG_ICASE;
  if (regcomp(&re, patternsBuffer, regFlags) == 0) compileResult = 1;
  return compileResult;
}

void addPatternE(char *patternsBuffer, int *totalPatterns) {
  if (*totalPatterns != 0) strcat(patternsBuffer, "|");
  strcat(patternsBuffer, optarg);
}

void addPatternF(char *patternsBuffer, int *totalPatterns) {
  char buffer[BUFFSIZE] = {0};
  FILE *fp = fopen(optarg, "r");
  if (fp != NULL) {
    while (fgets(buffer, BUFFSIZE, fp) != NULL) {
      if (buffer[0] == '\n') {
        if (*totalPatterns != 0) strcat(patternsBuffer, "|");
        strcat(patternsBuffer, "\n");
      }
      if (*totalPatterns != 0 && buffer[0] != '\n') {
        strcat(patternsBuffer, "|");
      }
      if (strlen(buffer) > 0 && buffer[strlen(buffer) - 1] == '\n') {
        buffer[strlen(buffer) - 1] = '\0';
      }
      strcat(patternsBuffer, buffer);
      *totalPatterns = *totalPatterns + 1;
    }
    fclose(fp);
  } else {
    fprintf(stderr, "grep: %s: No such file or directory\n", optarg);
  }
}

void parser(int argc, char **argv, char *patternsBuffer, int *totalPatterns,
            struct optionList *options) {
  int opt = 0;
  while ((opt = getopt_long(argc, argv, "e:ivclnhsf:o", NULL, NULL)) != -1) {
    switch (opt) {
      case 'i':
        options->optI = 1;
        break;
      case 'v':
        options->optV = 1;
        break;
      case 'c':
        options->optC = 1;
        break;
      case 'l':
        options->optL = 1;
        break;
      case 'n':
        options->optN = 1;
        break;
      case 'h':
        options->optH = 1;
        break;
      case 's':
        options->optS = 1;
        break;
      case 'o':
        options->optO = 1;
        break;
      case 'e':
        options->optE = 1;
        addPatternE(patternsBuffer, totalPatterns);
        *totalPatterns = *totalPatterns + 1;
        break;
      case 'f':
        options->optF = 1;
        addPatternF(patternsBuffer, totalPatterns);
        break;
      case '?':
        options->err = 1;
      default:
        break;
    }
  }
}