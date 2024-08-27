#!/bin/bash

# Variables
FILE="playground-deployment.yaml"
NEW_IMAGE="wil42/playground:v2"
GIT_MESSAGE="Update image version to $NEW_IMAGE in deployment"

# Check if the file exists
if [ ! -f "$FILE" ]; then
  echo "File $FILE does not exist."
  exit 1
fi

# Update the image version in the YAML file
sed -i "s|image: wil42/playground:v1|image: $NEW_IMAGE|" "$FILE"

# Check if sed command was successful
if [ $? -ne 0 ]; then
  echo "Failed to update image version."
  exit 1
fi

# Commit and push the changes to the repository
git add "$FILE"
git commit -m "$GIT_MESSAGE"
git push

# Check if git commands were successful
if [ $? -ne 0 ]; then
  echo "Failed to push changes to the repository."
  exit 1
fi

echo "Image version updated and changes pushed to repository successfully."
