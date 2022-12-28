Muhammad Sohail; ID: 260944101

--------------------------------------------------------------------------------------
----------------------------------- Included files -----------------------------------
--------------------------------------------------------------------------------------

    1. shell.c
          Main program, please compile this and only this (i.e., gcc shell.c)

    2. prelude.h
          A header file with constant definition, global variable declarations,
          function prototypes, and types

    3. builtin.c
          Contains functions that handle built-in processes such as the built-in
          commands (echo, pwd, etc.) and processing functions for piping and output
          redirection

    4. command.c
          Contains logic for command handling (processing user input) and execution
          (forking, regular vs piped execution, etc.)

    5. handlers.c
          Contains signal handlers and binders for the shell for SIGINT, SIGTSTP,
          and SIGCHLD

    6. joblist.c
          Contains data structure implementations for a job list that keeps track of
          background processes


---------------------------------------------------------------------------------------
---------------------------------------- Notes ----------------------------------------
---------------------------------------------------------------------------------------

  * Tokens are delimited with whitespace, even special tokens like "|", ">", or "&". that
    is, the shell will consider the command ls|wc>out.txt as one token (and thus fail)

  * Multi-pipe commands are supported (including built-in commands)

  * Output redirection is supported (including buitl-in commands)
    ->  If output redirection is indicated, tokens after the filename are ignored. i.e.,
        for "cmd args > name X Y Z", the tokens X, Y, and Z are ignored

  * Piping + output redirection is supported (in the background as well)
    ->  ex. ls -ltra | wc > out.txt &

  * For multi-piping, the idea of the "middle man" is illustrated by the following example of
    "ls | wc"

      Shell             Shell             Shell                          Shell
                          |                 |                              |
                          |                 |                              |
                ->    Middle Man        Middle Man        ->           Middle Man
                                            |                              |
                                            |                              |
                                        Process ls                     Process wc

    Essentially, the shell spawns a process (the middle man) which will execute the piped
    commands. First, it executes spawns a process and executes ls. Then, the Middle Man
    manages the output redirection and spawns another process for wc. The first if-statement
    in executePipedCommand() essentially deals with the creation of the middle man.

  * For background processes, the SIGINT signal is ignored so that they do not terminate

  * To handle output redirection for all commands, we set the stdout of the shell to the file,
    then execute (either a built-in command within the shell or an external command in a child
    process), then we reset the shell stdout to the terminal

  * If no argument is provided to the "fg" command, then it will bring the most recently
    background-ed task to the foreground