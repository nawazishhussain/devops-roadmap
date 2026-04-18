# System Monitoring & Resource Usage – Week 2

## What System Monitoring Is

System monitoring is the process of observing system resources and performance in real time.

It is used to:

* detect system issues
* identify performance bottlenecks
* troubleshoot failures

This is a core responsibility in DevOps and SRE roles.

---

## CPU (Central Processing Unit)

The CPU executes instructions for programs.

### CPU Usage

CPU usage represents how much processing power is being used.

High CPU usage can cause:

* slow performance
* delayed responses
* system overload

---

## Load Average

Command:

```bash
uptime
```

Example:

```
load average: 0.57, 0.58, 0.59
```

### Meaning

Load average represents the number of processes waiting for CPU.

| Value | Time Window     |
| ----- | --------------- |
| 1st   | last 1 minute   |
| 2nd   | last 5 minutes  |
| 3rd   | last 15 minutes |

### Interpretation

If system has **N CPU cores**:

* load = N → fully utilized
* load > N → overloaded
* load < N → under capacity

---

## `top` Command

Command:

```bash
top
```

Provides real-time system monitoring.

### Key Metrics

CPU section:

```
%Cpu(s): 10 us, 2 sy, 88 id
```

| Field | Meaning                   |
| ----- | ------------------------- |
| us    | user processes            |
| sy    | system (kernel) processes |
| id    | idle CPU                  |

---

## Memory (RAM)

RAM is temporary memory used by running programs.

If RAM is full:

* system slows down
* processes may crash

---

## `free` Command

```bash
free -h
```

### Flag

| Flag | Meaning               |
| ---- | --------------------- |
| -h   | human-readable format |

Example:

```
Mem: 8.0G total, 2.0G used, 6.0G free
```

### Important Concept: Cache

Linux uses RAM for caching data.

So high “used memory” is not always a problem.

---

## `htop`

Improved version of `top`.

Features:

* visual CPU/memory bars
* color-coded output
* easier navigation

Exit command:

```bash
q
```

---

## Disk Usage

### `df` Command

```bash
df -h
```

Shows disk space usage.

| Column | Meaning    |
| ------ | ---------- |
| Size   | total disk |
| Used   | used space |
| Avail  | free space |

---

### `du` Command

```bash
du -sh *
```

### Flags

| Flag | Meaning        |
| ---- | -------------- |
| -s   | summary        |
| -h   | human-readable |

Shows disk usage per file/directory.

---

## Process Monitoring

### `ps` Command

```bash
ps aux
```

### Flags

| Flag | Meaning              |
| ---- | -------------------- |
| a    | all users            |
| u    | detailed output      |
| x    | background processes |

---

### Filtering Processes

```bash
ps aux | grep process_name
```

---

## Killing Processes

### Graceful termination

```bash
kill PID
```

Sends **SIGTERM (signal 15)**.

---

### Force kill

```bash
kill -9 PID
```

| Flag | Meaning                     |
| ---- | --------------------------- |
| -9   | SIGKILL (force termination) |

---

## `top` vs `ps`

| Tool | Purpose               |
| ---- | --------------------- |
| top  | real-time monitoring  |
| ps   | snapshot of processes |

---

## `watch` Command

Runs a command repeatedly.

```bash
watch df -h
```

### Flag

```bash
watch -n 2 df -h
```

| Flag | Meaning             |
| ---- | ------------------- |
| -n 2 | run every 2 seconds |

---

## Real DevOps Workflow

When a system is slow:

1. Check CPU:

   ```bash
   top
   ```

2. Check memory:

   ```bash
   free -h
   ```

3. Check disk:

   ```bash
   df -h
   ```

4. Find problematic process:

   ```bash
   ps aux | grep process
   ```

5. Stop process if needed:

   ```bash
   kill PID
   ```

---

## Key Takeaways

* System monitoring is essential for debugging and performance analysis
* CPU load shows system pressure
* Memory usage includes caching (not always bad)
* Disk usage must be monitored to prevent failures
* Processes can be inspected and controlled
* Tools like `top`, `htop`, `ps`, and `df` are fundamental

These concepts are heavily used in:

* production debugging
* cloud infrastructure
* container environments
* incident response

