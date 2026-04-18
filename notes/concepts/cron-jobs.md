# Cron Jobs and Task Scheduling – Week 2

## What Cron Is

Cron is a time-based task scheduler used in Unix and Linux systems.

It allows commands or scripts to run automatically at specific times or intervals without manual execution.

Cron runs as a background service called a **daemon**.

---

## What a Daemon Is

A daemon is a background process that runs continuously and performs system tasks without user interaction.

Examples of common Linux daemons:

| Daemon  | Purpose                                   |
| ------- | ----------------------------------------- |
| cron    | scheduled task execution                  |
| sshd    | SSH remote login server                   |
| systemd | system initialization and service manager |
| nginx   | web server                                |

Cron constantly checks scheduled tasks and runs them when the scheduled time matches the current system time.

---

## What a Crontab Is

A **crontab** (cron table) is a configuration file that contains a list of scheduled tasks.

Each user can have their own crontab file.

Commands used to manage crontab:

```bash
crontab -l
crontab -e
crontab -r
```

### Crontab Flags

| Flag | Meaning                |
| ---- | ---------------------- |
| `-l` | list current cron jobs |
| `-e` | edit the crontab file  |
| `-r` | remove all cron jobs   |

---

## Cron Job Format

Each cron job follows this structure:

```
* * * * * command
```

Five fields define the schedule, followed by the command or script.

| Field | Meaning                                  |
| ----- | ---------------------------------------- |
| 1     | minute (0–59)                            |
| 2     | hour (0–23)                              |
| 3     | day of month (1–31)                      |
| 4     | month (1–12)                             |
| 5     | day of week (0–7, where 0 or 7 = Sunday) |

Example:

```
30 2 * * * /home/user/script.sh
```

Meaning: run the script every day at **2:30 AM**.

---

## Special Characters in Cron

Cron uses special characters to represent schedules.

### Asterisk (`*`)

Represents **every possible value**.

Example:

```
* * * * * command
```

Runs the command every minute.

---

### Comma (`,`)

Allows multiple specific values.

Example:

```
0 9,17 * * * command
```

Runs at **9 AM and 5 PM**.

---

### Dash (`-`)

Defines a range.

Example:

```
0 9-17 * * * command
```

Runs every hour between **9 AM and 5 PM**.

---

### Slash (`/`)

Defines intervals.

Example:

```
*/10 * * * * command
```

Runs every **10 minutes**.

---

## Example Cron Jobs

Run a script every minute:

```
* * * * * /home/user/script.sh
```

Run every day at midnight:

```
0 0 * * * /home/user/script.sh
```

Run every Sunday at 3 AM:

```
```

