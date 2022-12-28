OS Projects
============

These projects were developed as a part of McGill University's COMP 310 curriculum. Please refer to the sections following to learn more about each project! And of course, feel free to open an issue if something's not working.
<br/><br/>

> *For reasons of academic conduct, I have not included the source code of each project.*

<br/>

Preface: Setting up Docker
--------------------------

If you're not interested in executing the binaries and simply want read about the projects, feel free to [skip this section](#simple-shell)!

For those who are interested, I have included a [docker-compose.yml](docker-compose.yml) file which creates a Linux environment (so you can actually execute the binaries!). Refer to Docker's documentation for setup instructions for your system. Then, use `make run` in the root of this repository to start up the environment!

<br/>

Simple Shell
------------

The first project consists of, well, a simple shell! The project was an excellent exercise in process programming.

In the [shell](shell) directory, you will find the `simple-shell` executable file. Launching the executable will start up the CLI. It includes various features such as command piping, output redirection, launching commands in the background, signal handling, alongside various other things.

Again, note that this is a very simple shell and may not have all the functionality you'd expect from the usual Unix shell.

```bash
simple-shell $ curl wttr.in  # Calling a simple command
simple-shell $ ls | wc -l    # Command piping
simple-shell $ echo "What a lovely shell!" > output.txt  # Output redirection
simple-shell $ sleep 500 &   # Launching a command in the background
simple-shell $ fg            # Bringing a job to the foreground
```

<br/>

Thread Scheduling Library
--------------------------

This next project deals heavily with multi-threading in the user space. The library consists of two simple first come, first serve schedulers. The first manages CPU tasks while the other manages IO tasks (i.e., opening, closing, reading from, and writing to files).

In the [scheduler](scheduler) directory, you will find the binary library file, `libsut`, a header file `sut.h`, and a sample program `prog.c` that uses the various library functions. Here's a quick summary:

- `sut_init()` and `sut_shutdown()`: These functions initialize and terminate the scheduling library. Run them before and after all other library functions.

- `sut_create(fn)`: Creates a task (function) for execution by the library.

- `sut_yield()`: Must be called within a task. Willingly gives up (yields) the CPU.

- `sut_exit()`: Must be called within a task. Forcibly exits the task. Otherwise, the task will run till completion.

- `sut_[open|close|read|write]`: Standard file operations. Must be called within a task.

Feel free to create your own files to play around with the library. Be sure to include the `-pthread` option when compiling:
```bash
$ gcc -pthread libsut prog.c
```

<br/>

FUSE Filesystem
---------------

Perhaps my favourite project, the FUSE filesystem can be mounted by the user under any (single) directory. Of course, this is a very simplified filesystem with many restrictions such as no subdirectories, no file protection, and limited filenames, but nonetheless, it is a very interesting endeavour.

In the [fileystem](filesystem) directory, you will find two executables: `fresh` and `reuse`. As their names suggest, you can use these to either initialise a fresh filesystem or reuse an existing one.

### Using `fresh`:

```bash
$ mkdir temp      # Create your directory
$ ./fresh temp/   # Initialize the filesystem
```

### Using `reuse`:

```bash
$ ./reuse temp/   # Attaches the existing filesystem to the directory
```

Note, to detatch the filesystem from your directory, you must first kill the attaching process. For instance, use `ps aux | grep fresh` to find the pid of the process which attached a fresh filesystem. After killing this process, you need to remount the directory using `fusermount -u <dir>`

A further note, the filesystem has a maximum capacity of roughly 2 MB. Of course, this could have been made greater, but I'm sure you won't be using the filesystem that heavily
