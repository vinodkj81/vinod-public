#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating system packages..."
sudo yum update -y

echo "Adding the updated Jenkins repository..."
# Note the new URL path: rpm-stable instead of redhat-stable
sudo wget -O /etc/yum.repos.d/jenkins.repo \https://pkg.jenkins.io/rpm-stable/jenkins.repo

sudo yum upgrade -y

echo "Installing Java 21 (Amazon)..."
sudo dnf install java-21-amazon-corretto-headless -y


echo "Installing Jenkins..."
sudo yum install jenkins -y

echo "Starting and enabling Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "--------------------------------------------------------"
echo "Jenkins installation completed successfully!"
echo "Access it via web browser: http://$(hostname -I | awk '{print $1}'):8080"
echo "Your initial administrator password is:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "--------------------------------------------------------"
