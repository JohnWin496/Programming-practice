#include <stdio.h>
#include "listfuncs.h"

void printPID(struct List_item *listHead){
  struct List_item *current = listHead;
  while (current != NULL){
    printf("%d-",current->pcb->pid);
    current = current->next;
  }
  printf("\n");
}

int insert(struct List_item *listHead, struct List_item *insertItem){
  struct List_item *prev=listHead;
  struct List_item *current=listHead->next;
  while (current != NULL && insertItem->pcb->pid >= current->pcb->pid){
    prev = current;
    current = current->next;
  }
  if (prev->pcb->pid == insertItem->pcb->pid){
    return 0;
  }
  prev->next=insertItem;
  insertItem->next=current;
  return 1;
}

int delete(struct List_item *listHead, int pid){
  if (pid==1){
    return 0;
  }
  struct List_item *prev=listHead;
  struct List_item *current=listHead->next;
  while(current!=NULL && current->pcb->pid != pid){
    prev=current;
    current=current->next;
  }
  if (current==NULL){
    return 0;
  }
  prev->next=current->next;
  return 1;
}