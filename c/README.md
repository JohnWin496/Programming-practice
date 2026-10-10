Here is an explanation of the C code I wrote.

- 'listfuncs.h': header file defining a 'PCB' struct that contains name of the process and the ID of it, a 'List_item' struct defined that contains a pointer to a 'PCB' and a pointer to a "List_item'. This file also declares the insert, delete and output functions.
- 'listfuncs.c': functions of the linked list are written here: 'printPID' prints the list, 'insert' adds a process in sorted order by the process ID and rejects duplicates and 'delete' removes a process by process ID.
- 'main.c': tests 'listfuncs.h' and 'listfuncs.c' by inserting and deleting processes and prints the list every change made in the list.
