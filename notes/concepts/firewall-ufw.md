# Firewall & Security Basics (ufw) – Day 14

## TLCL Reference

* Chapter 14 → Networking (foundation for firewall concepts)

---

## What is a Firewall

A firewall controls **incoming and outgoing network traffic** based on rules.

It decides:

* which ports are open
* which connections are allowed or blocked

---

## Why Firewalls Matter

* Protect system from unauthorized access
* Reduce attack surface
* Control exposed services

---

## UFW (Uncomplicated Firewall)

`ufw` is a **simplified interface** for managing firewall rules.

It works on top of `iptables` (low-level firewall system).

---

## Check Firewall Status

```bash
sudo ufw status
```

### Output

| Status   | Meaning         |
| -------- | --------------- |
| inactive | firewall is OFF |
| active   | firewall is ON  |

---

## Enable Firewall

```bash
sudo ufw enable
```

⚠️ Important:

Before enabling:

```bash
sudo ufw allow 22
```

Reason:

* ensures SSH access
* prevents lockout

---

## Allow Ports

```bash
sudo ufw allow 80
```

Allows incoming traffic on port 80.

---

### Allow Specific Protocol

```bash
sudo ufw allow 53/udp
```

---

## Deny Ports

```bash
sudo ufw deny 80
```

Blocks traffic to port 80.

---

## Delete Rule

```bash
sudo ufw delete allow 80
```

---

## Verbose Output

```bash
sudo ufw status verbose
```

Shows detailed firewall configuration.

---

## Default Policies

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### Meaning

| Policy         | Effect                         |
| -------------- | ------------------------------ |
| deny incoming  | block all incoming connections |
| allow outgoing | allow all outgoing connections |

---

## Allow by Service Name

```bash
sudo ufw allow ssh
```

Equivalent to allowing port 22.

---

## Low-Level Firewall (iptables)

```bash
sudo iptables -L
```

### Flag

| Flag | Meaning             |
| ---- | ------------------- |
| -L   | list firewall rules |

---

## Rule Components

Each firewall rule includes:

* source (who is connecting)
* destination (target system)
* port (service)
* action (allow/deny)

---

## Allow Specific Network

```bash
sudo ufw allow from 192.168.1.0/24
```

Allows access only from that subnet.

---

## Check Running Services

```bash
ss -tulnp
```

Firewall rules apply to **active services**.

---

## Debugging “Service Not Reachable”

1. Check process

```bash
ps aux | grep process_name
```

2. Check port

```bash
ss -tulnp
```

3. Check firewall

```bash
sudo ufw status
```

4. Allow port

```bash
sudo ufw allow PORT
```

---

## Key Terms

### Port Exposure

Making a port accessible externally.

---

### Attack Surface

All exposed services/ports on a system.

---

### Principle of Least Privilege

Allow only necessary access.

---

## Common Issues

### SSH Lockout

Cause:

* firewall enabled without allowing port 22

---

### Service Not Reachable

Cause:

* firewall blocking port

---

## Testing Example

```bash
python3 -m http.server 8000
```

Then:

```bash
curl localhost:8000
```

If blocked:

```bash
sudo ufw allow 8000
```

---

## Key Takeaways

* firewall controls traffic access
* ufw simplifies firewall management
* always allow SSH before enabling firewall
* verify services before debugging firewall
* minimize open ports for security

---

## DevOps Relevance

Used in:

* server hardening
* cloud security groups
* production environments
* Kubernetes networking policies

---

