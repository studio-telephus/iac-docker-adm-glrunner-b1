#!/usr/bin/env bash

echo "Install JDK"

### Import the Corretto public key and then add the repository to the system list
wget -O - https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list

### After the repo has been added, you can install Corretto 21
apt-get update
apt-get install -y java-21-amazon-corretto-jdk

### Verify the installation
java -version
