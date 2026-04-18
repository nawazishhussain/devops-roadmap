# Environment Variables – Week 2

## What Environment Variables Are

Environment variables are **key-value pairs** stored by the operating system that programs can access while running.

Format:

```
KEY=value
```

Example:

```
HOME=/home/nwazish
```

Programs read these variables to determine configuration, paths, and runtime behavior.

Environment variables are widely used in:

* Linux systems
* Docker containers
* Kubernetes deployments
* CI/CD pipelines
* Cloud platforms

They allow configuration **without modifying application code**.

---

## Viewing Environment Variables

### Display all variables

```
printenv
```

or

```
env
```

Both commands list all environment variables available in the current shell.

Example output:

```
HOME=/home/nwazish
USER=nwazish
SHELL=/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin
```

---

## Viewing a Specific Variable

To view one variable:

```
printenv VARIABLE_NAME
```

Example:

```
printenv HOME
```

Output:

```
/home/nwazish
```

---

## Variable Expansion

Variables can be accessed using the `$` symbol.

Example:

```
echo $HOME
```

The shell replaces `$HOME` with the stored value.

This process is called **variable expansion**.

---

## Important Default Environment Variables

Some variables are automatically set by Linux.

| Variable | Meaning                   |
| -------- | ------------------------- |
| HOME     | user's home directory     |
| USER     | current username          |
| SHELL    | current shell             |
| PWD      | current working directory |
| PATH     | executable search paths   |
| TERM     | terminal type             |

Example:

```
echo $PWD
```

Output:

```
/home/nwazish
```

---

## The PATH Variable

The `PATH` variable tells the system where to search for executable programs.

Example:

```
echo $PATH
```

Example output:

```
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

When a command like `ls` is executed, Linux searches each directory listed in `PATH` until it finds the executable.

Example:

```
which ls
```

Output:

```
/usr/bin/ls
```

---

## Creating Environment Variables

Temporary variable:

```
export PROJECT=devops-roadmap
```

Verify:

```
echo $PROJECT
```

Output:

```
devops-roadmap
```

---

## What `export` Means

The `export` command makes a variable available to **child processes**.

Example:

```
export VAR=test
```

Programs launched from this shell can access the variable.

Without `export`, the variable remains local to the shell.

---

## Child Processes

A **child process** is a program started by another program.

Example:

```
bash → python script
```

The Python script is a child process of the Bash shell.

Child processes inherit exported environment variables.

---

## Removing Environment Variables

Variables can be removed with:

```
unset VARIABLE_NAME
```

Example:

```
unset PROJECT
```

Check:

```
echo $PROJECT
```

Output will be empty.

---

## Persistent Environment Variables

Variables created with `export` disappear when the terminal closes.

To make them permanent, add them to:

```
~/.bashrc
```

Example:

```
nano ~/.bashrc
```

Add:

```
export DEVOPS_ENV=learning
```

Apply changes:

```
source ~/.bashrc
```

---

## What `source` Does

The `source` command executes a file in the **current shell environment**.

Example:

```
source ~/.bashrc
```

This reloads the configuration without opening a new terminal.

---

## Real DevOps Use Cases

Environment variables are used for configuration in many systems.

Examples:

Docker container configuration:

```
docker run -e DB_HOST=10.0.0.5 myapp
```

CI/CD pipelines:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

Kubernetes configuration:

```
env:
  - name: DATABASE_HOST
    value: "db-service"
```

Environment variables allow applications to be configured **without modifying code**, which is critical for scalable infrastructure.

---

## Common Production Issue

Incorrect `PATH` values can break systems.

Example:

```
PATH=/usr/bin
```

Now commands like:

```
docker
kubectl
terraform
```

may stop working because their directories are no longer included in the search path.

---

## Key Takeaways

* Environment variables store configuration values.
* Programs read them at runtime.
* `$VAR` is used to access a variable.
* `export` allows variables to be inherited by child processes.
* `PATH` determines where Linux searches for executables.
* Permanent variables are usually stored in `.bashrc`.

Environment variables are heavily used in DevOps for configuring applications, containers, cloud infrastructure, and CI/CD systems.

