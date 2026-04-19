# Move key and secure it
mv ~/Downloads/devops-key.pem ~/.ssh/
chmod 400 ~/.ssh/devops-key.pem

# Connect to EC2
ssh -i ~/.ssh/devops-key.pem ubuntu@<your-public-ip>

# Start HTTP server
python3 -m http.server 8000

# Create HTML file
echo "Hello AWS" > index.html
