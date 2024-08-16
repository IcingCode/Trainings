#!/bin/bash

# Script to set up Ansible folder structure and configuration

# Detect the directory from where the script is being executed
CURRENT_DIR=$(dirname "$(realpath "$0")")

# Define the directory structure to be created
BASE_DIR=~/ansible
DIRS=("inventories" "roles" "ansible-dev-collections" "logs")

# Create the directory structure
for dir in "${DIRS[@]}"; do
    mkdir -p "${BASE_DIR}/${dir}"
done

echo "Directory structure created under ${BASE_DIR}"

# Copy hosts file to ~/ansible/inventories/ and set permissions
if [[ -f "${CURRENT_DIR}/hosts" ]]; then
    cp "${CURRENT_DIR}/hosts" "${BASE_DIR}/inventories/"
    chmod 600 "${BASE_DIR}/inventories/hosts"
    echo "hosts file copied to ${BASE_DIR}/inventories/ and permissions set to 600"
else
    echo "hosts file not found in ${CURRENT_DIR}. Please ensure it exists."
fi

# Copy ansible.cfg to ~/.ansible.cfg and set permissions
if [[ -f "${CURRENT_DIR}/ansible.cfg" ]]; then
    cp "${CURRENT_DIR}/ansible.cfg" ~/.ansible.cfg
    chmod 600 ~/.ansible.cfg
    echo "ansible.cfg copied to ~/.ansible.cfg and permissions set to 600"
else
    echo "ansible.cfg not found in ${CURRENT_DIR}. Please ensure it exists."
fi

echo "Ansible setup complete."
