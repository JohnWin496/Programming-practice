#ifndef LISTFUNCS_H
#define LISTFUNCS_H

#define NAME_LENGTH 32

typedef struct{
  int pid;
  char processName[NAME_LENGTH];
}PCB;

struct List_item{
  PCB *pcb;
  struct List_item *next;
};

int insert(struct List_item *listHead,struct List_item *insertItem);
int delete(struct List_item *listHead,int pid);
void printPID(struct List_item*listHead);

#endif