OS Projects
============

These projects were developed as a part of McGill University's COMP 310 curriculum. Please refer to the sections following to learn more about each project!
<br/><br/>

> *For code of conduct reasons, I have not included the source code of each project.*

<br/>


Simple Shell
------------

The first project consists of, well, a simple shell! The project was an excellent exercise in process programming.

In the [shell](shell) directory, you will find the `simple-shell` executable file. Launching the executable will start up the CLI. It includes various features such as command piping, output redirection, launching commands in the background, signal handling, alongside various other things.

Again, note that this is a very simple shell and may not have all the functionality you'd expect from a production Unix shell.

```bash
curl wttr.in  # Calling a simple command
ls | wc -l    # Command piping
echo "A lovely shell this is!" > out.txt  # Output redirection
sleep 500 &   # Launching a command in the background
fg            # Bringing a job to the foreground
```

<br/>



A Simple Thread Scheduler
--------------------------

This next project
