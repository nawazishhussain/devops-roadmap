# Day 16 — Nginx Deployment on EC2

## Objective

Deploy a production-grade web server (Nginx) on AWS EC2 and make it accessible over the internet.

---

## Step 1: Connect to EC2

Connected to the EC2 instance using SSH and verified access.

---

## Step 2: Install Nginx

Installed Nginx on the EC2 instance using the package manager.

---

## Step 3: Start and Enable Nginx

Started the Nginx service and enabled it to run on system boot.

---

## Step 4: Configure AWS Security Group

Configured inbound rules in the security group to allow HTTP traffic on port 80 from anywhere (0.0.0.0/0).

---

## Step 5: Access in Browser

Accessed the server using the public IP address in a browser and verified the default Nginx welcome page.

---

## Step 6: Deploy Custom Web Page

Replaced the default Nginx HTML page with a custom HTML file.

---

## Step 7: Restart Nginx

Restarted the Nginx service to apply changes and verified the custom page loads correctly.

---

## Step 8: Debugging

Used logs and service status checks to troubleshoot issues.

---

## Outcome

* Nginx successfully deployed on EC2
* Website accessible via public IP
* Custom HTML page served

---

## Key Learnings

* Production vs development servers
* Nginx fundamentals
* Service management using systemctl
* AWS Security Groups and networking basics
* Debugging using logs

---

## Issues Faced

* Website not accessible initially
  → Resolved by allowing port 80 in the security group

---

## Reference

All commands used are available in:

```id="refcmd"
commands.sh
```

