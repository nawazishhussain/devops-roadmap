# Bash Logic and Automation – Week 1

## Conditional Statements (if)

A conditional statement allows a script to make decisions based on whether a condition is true or false.

In Bash, the most common conditional structure is the **if statement**.

Example syntax:

```
if [ condition ]
then
    command
fi
```

Explanation:

* `if` → starts the condition check
* `[ condition ]` → the expression being tested
* `then` → commands executed if the condition is true
* `fi` → closes the if statement block

The condition inside `[ ]` returns an **exit code**:

* `0` → condition is true
* non-zero → condition is false

---

## Comparison Operators

Comparison operators are used to compare values inside conditions.

### Numeric comparison operators

| Operator | Meaning               |
| -------- | --------------------- |
| `-eq`    | equal                 |
| `-ne`    | not equal             |
| `-gt`    | greater than          |
| `-lt`    | less than             |
| `-ge`    | greater than or equal |
| `-le`    | less than or equal    |

Example:

```
num=15

if [ $num -gt 10 ]
then
    echo "Number is greater than 10"
fi
```

---

### String comparison operators

Used when comparing text values.

| Operator | Meaning             |
| -------- | ------------------- |
| `=`      | equal               |
| `!=`     | not equal           |
| `-z`     | string is empty     |
| `-n`     | string is not empty |

Example:

```
name="DevOps"

if [ "$name" = "DevOps" ]
then
    echo "Correct name"
fi
```

Quotes are important when working with strings to prevent errors.

---

## If-Else Statements

An if-else statement allows two possible outcomes depending on the condition.

Example:

```
disk=80

if [ $disk -gt 70 ]
then
    echo "Disk usage high"
else
    echo "Disk usage normal"
fi
```

---

## If-Else-If (Multiple Conditions)

Used when multiple conditions need to be checked.

Example:

```
num=15

if [ $num -gt 20 ]
then
    echo "Greater than 20"
elif [ $num -gt 10 ]
then
    echo "Greater than 10"
else
    echo "10 or less"
fi
```

---

## Loops

A loop repeats a set of commands multiple times.

Loops are commonly used in automation tasks such as processing multiple files or running commands across many systems.

---

## For Loop

A **for loop** iterates through a list of values.

Syntax:

```
for variable in list
do
    command
done
```

Example:

```
for i in 1 2 3 4 5
do
    echo "Number: $i"
done
```

Each repetition of a loop is called an **iteration**.

---

## Looping Through Files

The `*` wildcard represents all files in the current directory.

Example:

```
for file in *
do
    echo $file
done
```

This prints the name of every file in the directory.

---

## While Loop

A **while loop** runs repeatedly as long as a condition remains true.

Syntax:

```
while [ condition ]
do
    command
done
```

Example:

```
count=1

while [ $count -le 5 ]
do
    echo $count
    count=$((count+1))
done
```

---

## Arithmetic Expansion

Arithmetic expansion allows Bash to perform mathematical calculations.

Syntax:

```
$((expression))
```

Example:

```
count=$((count+1))
```

This increases the value of the variable `count` by one.

---

## Reading User Input

The `read` command allows scripts to accept input from the user.

Example:

```
echo "Enter your name:"
read name

echo "Hello $name"
```

---

## Standard Streams

Linux programs interact with three main data streams.

| Stream | Description                     |
| ------ | ------------------------------- |
| stdin  | standard input (data from user) |
| stdout | standard output (normal output) |
| stderr | error output                    |

These streams allow programs to communicate with users and other programs.

---

## Commands Used in Practice

```
if
elif
else
for
while
read
echo
```

---

## Observations

* Conditional statements allow scripts to make decisions automatically.
* Loops allow repetitive tasks to be executed efficiently.
* Arithmetic expansion enables simple calculations in Bash.
* User input allows scripts to interact dynamically with users.
* These features make Bash suitable for system automation and DevOps workflows.

