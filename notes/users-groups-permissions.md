# Users, Groups, and Permissions – Week 2

## TLCL Reference

From *The Linux Command Line*:

* Chapter 9 → Permissions
* Chapter 10 → Processes (related context)
* Chapter 11 → Environment (reinforcement)

---

## Linux User Model

Linux is a **multi-user system**, meaning multiple users can operate on the same system simultaneously.

Each file and process is associated with:

* a **user (owner)**
* a **group**

---

## What a User Is

A user is an account that can:

* execute commands
* own files
* run processes

Examples:

```id="u1"
nwazish
root
devopsuser
```

---

## What Root Is

`root` is the **superuser**.

It has:

* unrestricted system access
* permission to modify any file
* control over all users and processes

---

## What a Group Is

A group is a collection of users.

Used to manage permissions efficiently.

Example:

```id="g1"
developers
admins
docker
```

Instead of assigning permissions individually, you assign them to groups.

---

## File Ownership

Check ownership using:

```bash id="o1"
ls -l
```

Example:

```id="o2"
-rw-r--r-- 1 nwazish devops 1234 file.txt
```

---

### Breakdown

| Part        | Meaning     |
| ----------- | ----------- |
| `-`         | file type   |
| `rw-r--r--` | permissions |
| `nwazish`   | owner       |
| `devops`    | group       |

---

## File Types

| Symbol | Meaning       |
| ------ | ------------- |
| `-`    | regular file  |
| `d`    | directory     |
| `l`    | symbolic link |

---

## Permissions Structure

Example:

```id="p1"
rw-r--r--
```

Split:

```id="p2"
rw-  r--  r--
```

| Section | Applies To |
| ------- | ---------- |
| 1st     | owner      |
| 2nd     | group      |
| 3rd     | others     |

---

## Permission Types

| Symbol | Meaning |
| ------ | ------- |
| r      | read    |
| w      | write   |
| x      | execute |

---

### Example Meaning

```id="p3"
rw-r--r--
```

| Entity | Permissions |
| ------ | ----------- |
| owner  | read, write |
| group  | read        |
| others | read        |

---

## Changing Permissions (`chmod`)

### Symbolic Mode

```bash id="c1"
chmod u+x file.sh
```

| Part | Meaning        |
| ---- | -------------- |
| u    | user (owner)   |
| +    | add permission |
| x    | execute        |

---

### More Examples

```bash id="c2"
chmod g-w file.txt
chmod o+r file.txt
```

| Symbol | Meaning |
| ------ | ------- |
| g      | group   |
| o      | others  |

---

## Numeric Mode

Permissions can also be represented numerically.

| Permission | Value |
| ---------- | ----- |
| r          | 4     |
| w          | 2     |
| x          | 1     |

---

### Example

```bash id="c3"
chmod 755 script.sh
```

Breakdown:

```id="c4"
7 = 4 + 2 + 1 = rwx
5 = 4 + 1 = r-x
5 = 4 + 1 = r-x
```

---

## Changing Ownership (`chown`)

```bash id="c5"
sudo chown user:group file
```

Example:

```bash id="c6"
sudo chown devopsuser:devops file.txt
```

---

### Change Only Owner

```bash id="c7"
sudo chown devopsuser file.txt
```

---

### Recursive Change

```bash id="c8"
sudo chown -R user:group folder/
```

| Flag | Meaning                                         |
| ---- | ----------------------------------------------- |
| -R   | recursive (apply to all files inside directory) |

---

## Changing Group (`chgrp`)

```bash id="c9"
chgrp group file
```

Example:

```bash id="c10"
chgrp devops file.txt
```

---

## Directory Permissions

Directories behave differently than files.

| Permission | Meaning                     |
| ---------- | --------------------------- |
| r          | list files inside directory |
| w          | create/delete files         |
| x          | enter directory (cd)        |

---

### Critical Concept

Without `x` permission on a directory, you cannot access it—even if you have read permission.

---

## Special Permissions

### SUID (Set User ID)

```bash id="s1"
chmod u+s file
```

Runs the file with the owner's privileges.

---

### SGID

```bash id="s2"
chmod g+s directory
```

New files inherit the directory’s group.

---

### Sticky Bit

```bash id="s3"
chmod +t directory
```

Only file owner can delete files (used in `/tmp`).

---

## Viewing User Information

### Current user

```bash id="v1"
whoami
```

---

### User details

```bash id="v2"
id
```

Shows:

* UID (user ID)
* GID (group ID)
* group memberships

---

### Groups

```bash id="v3"
groups
```

---

## Common Real-World Issues

### Permission Denied

Cause:

* missing read/write/execute permission

---

### Script Not Executing

Cause:

* missing execute permission

Fix:

```bash id="e1"
chmod +x script.sh
```

---

### Web Server Cannot Read Files

Cause:

* incorrect ownership or permissions

---

### Container Permission Issues

Cause:

* UID/GID mismatch between host and container

---

## Key Takeaways

* Linux uses a user-group permission model
* Each file has an owner and a group
* Permissions are divided into owner, group, and others
* `chmod` modifies permissions
* `chown` and `chgrp` modify ownership
* Directory permissions behave differently from files
* Special permissions control advanced access behavior

Understanding permissions is critical for:

* system security
* server management
* container environments
* production debugging

