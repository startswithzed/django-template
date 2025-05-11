#!/bin/bash

# Check if project name is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a project name"
    echo "Usage: ./init_project.sh <project-name>"
    exit 1
fi

NEW_PROJECT_NAME=$1
OLD_PROJECT_NAME="django-template"

# Convert first letter to uppercase for title case
NEW_PROJECT_NAME_TITLE=$(echo "$NEW_PROJECT_NAME" | awk '{print toupper(substr($0,1,1)) substr($0,2)}')

# Function to replace text in files
replace_text() {
    local file=$1
    if [ -f "$file" ]; then
        # For macOS
        if [[ "$OSTYPE" == "darwin"* ]]; then
            # Replace exact matches
            sed -i '' "s/$OLD_PROJECT_NAME/$NEW_PROJECT_NAME/g" "$file"
            # Replace in title case
            sed -i '' "s/Django Template/Django $NEW_PROJECT_NAME_TITLE/g" "$file"
            # Replace in sentence case
            sed -i '' "s/Django template/Django $NEW_PROJECT_NAME_TITLE/g" "$file"
            # Replace in lowercase
            sed -i '' "s/django template/django $NEW_PROJECT_NAME/g" "$file"
        else
            # For Linux
            sed -i "s/$OLD_PROJECT_NAME/$NEW_PROJECT_NAME/g" "$file"
            sed -i "s/Django Template/Django $NEW_PROJECT_NAME_TITLE/g" "$file"
            sed -i "s/Django template/Django $NEW_PROJECT_NAME_TITLE/g" "$file"
            sed -i "s/django template/django $NEW_PROJECT_NAME/g" "$file"
        fi
    fi
}

# Replace in key files
replace_text "pyproject.toml"
replace_text "README.md"
replace_text "docker-compose.yml"
replace_text "Dockerfile"
replace_text "uv.lock"

# Update project directory name
if [ -d "$OLD_PROJECT_NAME" ]; then
    mv "$OLD_PROJECT_NAME" "$NEW_PROJECT_NAME"
fi

echo "Project initialized successfully!"
echo "New project name: $NEW_PROJECT_NAME"
echo "Please review the changes and update any additional references if needed." 