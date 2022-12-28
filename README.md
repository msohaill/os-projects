OS Projects
============

These projects were developed as a part of McGill University's COMP 310 curriculum. Please refer to the sections following to learn more about each project!
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

Again, note that this is a very simple shell and may not have all the functionality you'd expect from a production Unix shell.

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

This next project

<br/>

FUSE Filesystem
---------------
