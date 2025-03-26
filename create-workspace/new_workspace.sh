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
cp "$SOURCE_DIR/main.tf" "$SOURCE_DIR/variables.tf" "$SOURCE_DIR/data.tf" "$SOURCE_DIR/terraform.tfvars" "$folder_name/"

####Set the workspace_name same as the created folder name####
# Define the terraform.tfvars file path
TFVARS_FILE="$folder_name/terraform.tfvars"

# If terraform.tfvars exists, update workspace_name, otherwise create it
if [[ -f "$TFVARS_FILE" ]]; then
    # Update workspace_name in-place
    sed -i "s/^workspace_name.*/workspace_name    = \"$folder_name\"/" "$TFVARS_FILE"
    sed -i "s/^working_directory.*/working_directory    = \"$folder_name\"/" "$TFVARS_FILE"
else
    # Create a new terraform.tfvars file with workspace_name
    echo "workspace_name    = \"$folder_name\"" > "$TFVARS_FILE"
fi


# Confirm success
echo "Files copied successfully to '$folder_name'."
