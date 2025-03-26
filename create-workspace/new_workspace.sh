#!/bin/bash

# Prompt for the new folder name
read -p "Enter the new folder name: " folder_name

# Check if folder name is provided
if [[ -z "$folder_name" ]]; then
    echo "Folder name cannot be empty. Exiting."
    exit 1
fi

# Create the new folder
mkdir -p "$folder_name"

# Check if source folder exists
SOURCE_DIR="test-cluster1"
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Source folder '$SOURCE_DIR' does not exist. Exiting."
    exit 1
fi

# Copy files
cp "$SOURCE_DIR/main.tf" "$SOURCE_DIR/variables.tf" "$SOURCE_DIR/data.tf" "$SOURCE_DIR/terraform.tfvars""$folder_name/"

# Confirm success
echo "Files copied successfully to '$folder_name'."
