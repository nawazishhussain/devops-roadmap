# Day 15 - AWS EC2 + HTTP Server

## Objective
Launch an EC2 instance and host a simple web server.

## Steps Performed

### 1. EC2 Setup
- Launched Ubuntu 22.04 instance
- Instance type: t3.micro
- Key pair created and downloaded

### 2. Security Group
- Allowed SSH (port 22)
- Allowed HTTP custom port (8000)

### 3. SSH Connection
```bash
ssh -i devops-key.pem ubuntu@<public-ip>
