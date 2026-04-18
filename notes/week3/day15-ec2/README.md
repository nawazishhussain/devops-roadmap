# Day 15 - EC2 + HTTP Server

## Objective
Deploy a server on AWS EC2 and expose it publicly.

## Architecture
Client → Internet → AWS Security Group → EC2 → Python HTTP Server

## Steps

### 1. Launch EC2
- Ubuntu 22.04
- t3.micro

### 2. Security Group
- Port 22 (SSH)
- Port 8000 (HTTP)

### 3. SSH
ssh -i devops-key.pem ubuntu@<public-ip>

### 4. Run Server
python3 -m http.server 8000

### 5. Test
http://<public-ip>:8000

## Errors Faced

### Issue 1: Couldn't connect to server
**Cause:** Port 8000 not allowed  
**Fix:** Added rule in security group  

### Issue 2: File not found (404)
**Cause:** No index.html  
**Fix:** Created file  

## Learnings
- Security groups act as firewall  
- 0.0.0.0 vs localhost matters  
- Logs show real traffic  

## Proof
(Add screenshots or logs)
