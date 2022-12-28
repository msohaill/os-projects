Muhammad Sohail; ID: 260944101

--------------------------------------------------------------------------------------
----------------------------------- Included files -----------------------------------
--------------------------------------------------------------------------------------

    1. sut.c
        Contains library functions; please compile this and only this alongside your main
        file. i.e., if your main file is prog.c, run `gcc sut.c prog.c`

    2. sut.h
        Contains the function prototypes. Make sure to #include this in you main file, i.e.,
        #include "sut.h"

    2. prelude.h
        A header file with constant definition, global variable declarations,
        function prototypes, and types. It is used only by internal library files

    3. queue.c
        Contains functions that handle the basic inner queue operations (mostly retained
        from the support code file)

    4. taskqueue.c
        Contains functions and logic for a mutually exclusive task queue and other similar
        operations

    5. runners.c
        Contains the C-EXEC and I-EXEC runners. These runners will handle the
        processing of tasks in the associated queues (i.e., pulling a task and switching
        context)

    6. compute.c
        Contains logic for compute operations such as pulling tasks and switching context,
        creating new tasks, yielding tasks, and exiting tasks

    7. io.c
        Contains logic for IO operations such as pulling IO tasks and processing them,
        creating new IO tasks, and scheduling the execution of each type of task (open,
        close, read, write) and handling their results


---------------------------------------------------------------------------------------
---------------------------------------- Notes ----------------------------------------
---------------------------------------------------------------------------------------

    *   Scheduled tasks do not *need* to run sut_exit(). I have ensured all tasks will cleanup

    *   The support code for queue.c has been heavily modified. You can take a look if need be,
        but, essentially, the queue.c file contains the modified support code and taskqueue.c
        contains mutex logic + other task-related logic

    *   Again, do make sure to `#include "sut.h"` and incorporate sut.c when compiling:
        `gcc sut.c prog.c`

    *   As it was not specified what exactly sut_read() should return, my implementation returns
        (if successful) the buffer into which data was read. Otherwise, it returns NULL (on failure)



