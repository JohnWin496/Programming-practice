#include <stdio.h>
#include "listfuncs.h"

int main(void){
  PCB headPCB={1,"init"};
  struct List_item head={&headPCB,NULL};

  printf("Inserting Process10\n");
  PCB pcb10={10,"Process10"};
  struct List_item pcbten={&pcb10,NULL}; 
  int result=insert(&head,&pcbten);
  printf("Result: %d\n", result);
  printPID(&head);

  printf("\nInserting Process7\n");
  PCB pcb7={7,"Process7"};
  struct List_item pcbseven={&pcb7,NULL}; 
  result=insert(&head,&pcbseven);
  printf("Result: %d\n", result);
  printPID(&head);

  printf("\nInserting Process7 again\n");
  PCB pcb7v2={7,"Process7"};
  struct List_item pcbseven2={&pcb7v2,NULL}; 
  result=insert(&head,&pcbseven2);
  printf("Result: %d\n", result);
  printPID(&head);

  printf("\nInserting Process20\n");
  PCB pcb20={20,"Process20"};
  struct List_item pcbtwenty={&pcb20,NULL}; 
  result=insert(&head,&pcbtwenty);
  printf("Result: %d\n", result);
  printPID(&head);
 
  printf("\nDeleting Process20\n");
  result=delete(&head,20);
  printf("Result: %d\n", result);
  printPID(&head);

  printf("\nDeleting Process7\n");
  result=delete(&head,7);
  printf("Result: %d\n", result);
  printPID(&head);

  printf("\nDeleting Process1\n");
  result=delete(&head,1);
  printf("Result: %d\n", result);
  printPID(&head);

  return 0;
}
