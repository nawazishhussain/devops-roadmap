# Linux Text Processing and Pipelines – Week 1

## Why Text Processing Matters

Most Linux tools produce output as plain text.
Examples include system commands and log files.

Examples:

```id="2y0j2p"
ps aux
df -h
journalctl
```

Instead of reading large amounts of text manually, Linux provides tools that allow users to search, filter, and transform text efficiently.

Text processing tools are heavily used in system administration, debugging, and DevOps automation.

---

## Pipelines

A pipeline connects multiple commands together so that the output of one command becomes the input of another command.

Pipeline operator:

```id="v37sz0"
|
```

Example:

```id="v2ojc8"
ps aux | grep ssh
```

Explanation:

1. `ps aux` lists all running processes.
2. `grep ssh` filters the output to show only lines containing the word "ssh".

The pipe sends the output of `ps` to the input of `grep`.

---

## Standard Streams

Linux programs communicate through three standard streams.

| Stream | Description                             |
| ------ | --------------------------------------- |
| stdin  | standard input (data sent to a program) |
| stdout | standard output (normal program output) |
| stderr | standard error (error messages)         |

Pipelines typically connect the **stdout of one command** to the **stdin of another command**.

---

## grep — Searching Text

`grep` searches for patterns in text.

Syntax:

```id="2ejibq"
grep pattern file
```

Example:

```id="aw5w7i"
grep root /etc/passwd
```

This command prints lines containing the word "root".

### Useful grep options

| Option | Meaning                         |
| ------ | ------------------------------- |
| `-i`   | ignore case                     |
| `-r`   | recursive search in directories |
| `-n`   | show line numbers               |
| `-v`   | invert match (exclude pattern)  |

Example:

```id="l43j2a"
grep -i error logfile.txt
```

---

## Pattern

A pattern is the text you want to search for.

Examples:

```id="yydh7a"
error
ssh
docker
nginx
```

Patterns help filter useful information from large outputs or logs.

---

## awk — Column-Based Text Processing

`awk` is used to process structured text and extract specific columns.

Many Linux commands display output in columns separated by spaces.

Example command:

```id="r5slg0"
ps aux
```

Columns include:

```id="0cb0dw"
USER PID CPU MEM COMMAND
```

awk can extract specific columns.

Example:

```id="1u1pkb"
ps aux | awk '{print $1}'
```

This prints the first column (the username).

Example:

```id="q26u8c"
ps aux | awk '{print $2}'
```

This prints the process ID column.

---

## sed — Stream Editor

`sed` is used to modify text streams.

A **stream** is a continuous flow of text data.

Example substitution:

```id="o4fzvl"
echo "hello world" | sed 's/world/devops/'
```

Output:

```id="u6p9bs"
hello devops
```

### Substitution Syntax

```id="bhsjta"
s/pattern/replacement/
```

Where:

* `s` = substitute
* `pattern` = text to replace
* `replacement` = new text

To replace all occurrences:

```id="g0xk0g"
sed 's/foo/bar/g'
```

The `g` means **global replacement**.

---

## head

`head` shows the first lines of a file.

Example:

```id="bixpdb"
head file.txt
```

Default output is the first 10 lines.

---

## tail

`tail` shows the last lines of a file.

Example:

```id="avus8f"
tail file.txt
```

---

## tail -f (Log Monitoring)

```id="8wkp41"
tail -f logfile.txt
```

This command continuously displays new lines added to the file.

It is commonly used to monitor logs while debugging running services.

---

## Combining Commands with Pipelines

Multiple commands can be combined to perform complex operations.

Example:

```id="jwjsxx"
ps aux | grep ssh | awk '{print $2}'
```

Steps:

1. list all processes
2. filter processes containing "ssh"
3. extract the process ID column

Another example:

```id="4ejy5m"
df -h | awk '{print $5 " " $6}'
```

This displays disk usage percentage and mount point.

---

## Observations

* Linux commands produce structured text output.
* Pipelines allow commands to work together.
* grep filters text using patterns.
* awk extracts structured columns from command output.
* sed modifies text streams.
* head and tail help inspect file contents quickly.

These tools are widely used in system administration, log analysis, and automation scripts.

