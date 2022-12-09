#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <string.h>

#define BUFFSIZE 1000

regex_t re;
regmatch_t pmatch[1] = {0};

struct optionList {
  int optE;
  int optI;
  int optV;
  int optC;
  int optL;
  int optN;
  int optH;
  int optS;
  int optF;
  int optO;
  int err;
};

void parser(int argc, char **argv, char *patternsBuffer, int *totalPatterns,
            struct optionList *options);
void addPatternE(char *patternBuffer, int *totalPatterns);
void addPatternF(char *patternsBuffer, int *totalPatterns);
int compilePatterns(char *patternsBuffer, struct optionList *options);
void addPatternDefault(char *patternsBuffer, char **argv);
void readFile(int argc, char **argv, struct optionList *options);
void output(char *buffer, char *currentFile, int totalFiles, int lineCounter,
            struct optionList *options);
void outputOnlyMatchesCounter(char *currentFile, int totalFiles,
                              int matchCounter, struct optionList *options);
void checkForSpace(char *buffer, int lineCounter, int lastLineCounter,
                   struct optionList *options);
void outputWithO(char *buffer, char *currentFile, int totalFiles,
                 int lineCounter, struct optionList *options);
void optimizingFlags(struct optionList *options);

#endif  // SRC_GREP_S21_GREP_H_