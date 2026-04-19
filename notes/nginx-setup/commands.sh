#!/bin/bash

# Connect to EC2
ssh -i ~/.ssh/devops-key.pem ubuntu@<your-public-ip>

# Update system
sudo apt update

# Install nginx
sudo apt install nginx -y

# Start nginx
sudo systemctl start nginx

# Enable nginx on boot
sudo systemctl enable nginx

# Check status
systemctl status nginx

# Go to web root
cd /var/www/html

# Edit HTML
sudo nano index.html

# Restart nginx
sudo systemctl restart nginx

# Debug logs
sudo tail -f /var/log/nginx/access.log

# Check port 80
sudo netstat -tulnp | grep 80
