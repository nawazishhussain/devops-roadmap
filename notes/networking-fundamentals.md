# Networking Fundamentals – Day 13 (Week 2)

## TLCL Reference

* Chapter 14: Networking
* Chapter 16: Package Management (network usage context)

---

## What Networking Is

Networking is the communication between systems over a network.

In DevOps, this includes:

* servers communicating with each other
* containers interacting
* users accessing services

---

## IP Address

An IP address uniquely identifies a device on a network.

Example:

```
192.168.1.10
```

---

### Types of IP Addresses

#### Private IP

Used inside local networks:

```
192.168.x.x
10.x.x.x
172.16.x.x – 172.31.x.x
```

#### Public IP

Used on the internet and assigned by an ISP.

---

## Checking IP Address

```
ip a
```

Example output:

```
inet 10.99.143.125/24
```

### Breakdown

| Component     | Meaning      |
| ------------- | ------------ |
| inet          | IPv4 address |
| 10.99.143.125 | IP           |
| /24           | subnet       |

---

## Subnet

`/24` means:

* 24 bits = network
* remaining bits = hosts

Equivalent:

```
255.255.255.0
```

---

## Loopback Address

```
127.0.0.1
```

Means:

* your own system
* used for local testing

---

## Ports

A port identifies a service on a machine.

Analogy:

* IP = house
* Port = room

---

### Common Ports

| Port | Service |
| ---- | ------- |
| 22   | SSH     |
| 80   | HTTP    |
| 443  | HTTPS   |
| 3306 | MySQL   |

---

## Checking Open Ports

```
ss -tulnp
```

### Flags

| Flag | Meaning      |
| ---- | ------------ |
| -t   | TCP          |
| -u   | UDP          |
| -l   | listening    |
| -n   | numeric      |
| -p   | process info |

---

## Binding Addresses

### 0.0.0.0

* listens on all interfaces
* accessible from network

### 127.0.0.1

* local only
* not accessible externally

---

## DNS (Domain Name System)

Converts:

```
google.com → IP address
```

---

## ping Command

```
ping google.com
```

### Purpose

* checks connectivity
* sends ICMP packets

### Flag

```
ping -c 4 google.com
```

| Flag | Meaning           |
| ---- | ----------------- |
| -c   | number of packets |

---

## curl Command

```
curl http://example.com
```

Used to:

* make HTTP requests
* test APIs

### Flag

```
curl -I http://example.com
```

| Flag | Meaning      |
| ---- | ------------ |
| -I   | headers only |

---

## wget Command

```
wget http://example.com/file.zip
```

Used to download files.

---

## Routing

```
ip route
```

Example:

```
default via 10.99.143.1 dev wlo1
```

### Breakdown

| Part    | Meaning       |
| ------- | ------------- |
| default | default route |
| via     | gateway       |
| dev     | interface     |

---

## Gateway

Gateway = router.

Connects your system to:

* internet
* external networks

---

## Network Interfaces

Examples:

| Interface | Meaning  |
| --------- | -------- |
| wlo1      | WiFi     |
| eth0      | Ethernet |
| lo        | Loopback |

---

## Debugging “Service Not Reachable”

### Step 1 — Check process

```
ps aux | grep process_name
```

---

### Step 2 — Check port

```
ss -tulnp
```

---

### Step 3 — Check binding

* 127.0.0.1 → local only
* 0.0.0.0 → external access

---

### Step 4 — Test locally

```
curl localhost:PORT
```

---

### Step 5 — Check connectivity

```
ping IP
```

---

## Common Error: Connection Refused

Cause:

* no service running
* port not listening

Fix:

* start the service
* verify using `ss -tulnp`

---

## Practical Commands

```
ip a
ip route
ss -tulnp
ping -c 4 google.com
curl -I http://example.com
```

---

## Running a Test Server

```
python3 -m http.server 8000
```

---

## Verify Server

```
ss -tulnp | grep 8000
curl localhost:8000
```

---

## Key Takeaways

* IP identifies machines
* ports identify services
* DNS resolves domain names
* `ss` shows active ports
* binding determines accessibility
* debugging follows a structured approach

---

## DevOps Relevance

These concepts are used in:

* Kubernetes networking
* cloud infrastructure
* microservices communication
* API debugging
* load balancers

Understanding networking is critical for diagnosing production issues.

