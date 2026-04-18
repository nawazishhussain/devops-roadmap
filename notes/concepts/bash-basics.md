# Bash Scripting Basics – Week 1

## What is a Shell

A shell is a program that provides a command-line interface between the user and the Linux operating system.
It interprets commands typed by the user and executes them.

Example shell used in most Linux systems:

* **bash** (Bourne Again Shell)

Other shells exist (zsh, sh, fish), but Bash is the most commonly used in DevOps environments.

---

## What is a Bash Script

A Bash script is a text file containing a sequence of shell commands that are executed automatically.

Instead of typing commands one by one in the terminal, they are stored in a file and run together.

Example script tasks:

* system monitoring
* deployment automation
* server configuration
* CI/CD pipeline steps

---

## Shebang (#!)

Example:

```
#!/bin/bash
```

The shebang tells Linux which interpreter should execute the script.

In this case:

* `/bin/bash` runs the script using the Bash interpreter.

Without a shebang, the system may not know how to run the script correctly.

---

## echo Command

`echo` prints text to the terminal.

Example:

```
echo "Hello World"
```

Used frequently in scripts to display messages or output.

---

## Making Scripts Executable

Linux files need execute permission before they can run as programs.

Command used:

```
chmod +x script_name.sh
```

Meaning:

* `chmod` = change file permissions
* `+x` = add execute permission

Example:

```
chmod +x system_report.sh
```

---

## Running a Script

Scripts in the current directory are executed using:

```
./script_name.sh
```

Example:

```
./system_report.sh
```

The `./` tells the shell to run the script from the current directory.

---

## Command Substitution

Command substitution allows the output of a command to be used inside another command.

Syntax:

```
$(command)
```

Example:

```
echo "Today is $(date)"
```

The shell runs the command inside `$()` first and inserts the output.

---

## Variables

Variables store data that can be reused in scripts.

Example:

```
name="DevOps"
echo $name
```

Rules:

* No spaces around `=`
* Use `$` to access the variable value

Correct:

```
name="DevOps"
```

Incorrect:

```
name = "DevOps"
```

---

## Exit Codes

Every command returns an exit code.

Exit codes indicate whether a command succeeded or failed.

| Exit Code | Meaning          |
| --------- | ---------------- |
| 0         | Success          |
| Non-zero  | Error or failure |

To check the exit code of the last command:

```
echo $?
```

Exit codes are important in automation because scripts use them to detect failures.

---

## Commands Practiced

```
echo
date
whoami
uptime
pwd
df -h
free -h
chmod +x
```

---

## Observations

* Bash scripts allow automation of repetitive tasks.
* Command substitution helps include dynamic information in script output.
* File permissions control whether scripts can execute.
* Exit codes are essential for detecting success or failure in automated workflows.

