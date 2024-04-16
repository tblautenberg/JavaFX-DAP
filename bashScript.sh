#!/bin/bash

# Print current directory for debugging
echo "Current directory: $(pwd)"

# Verify if the JAR file exists
if [ -f "JavaDockerContainerAutoPull-1.0-SNAPSHOT.jar" ]; then
    # Run the JAR file
    echo "Executing JAR file..."
    java -jar JavaDockerContainerAutoPull-1.0-SNAPSHOT.jar
    # Check the exit status of the previous command
    if [ $? -eq 0 ]; then
        echo "JAR execution finished successfully."
        
        # Move to /app/target-repo and run mvn clean package
        cd /app/target-repo
        echo "Moving to /app/target-repo and running mvn clean package..."
        mvn clean javafx:run
        if [ $? -eq 0 ]; then
            echo "mvn ran javafx program successfully."
        fi
    fi
fi

echo "Script execution completed."
