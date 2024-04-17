#!/bin/bash

# Print current directory for debugging
echo "**** WELCOME TO JAVAFX-DAP ****"
echo "Current directory: $(pwd)"

# Verify if the JAR file exists
if [ -f "JavaDockerContainerAutoPull-1.0-SNAPSHOT.jar" ]; then
    # Run the JAR file
    echo "Executing the pre-built JavaFX-DAP JAR file..."
    java -jar JavaDockerContainerAutoPull-1.0-SNAPSHOT.jar
    # Check the exit status of the previous command
    if [ $? -eq 0 ]; then
        echo "JavaFX-DAP JAR execution finished successfully - github repo is pulled down to target-repo."
        
        # Move to /app/target-repo and run mvn clean package
        cd /app/target-repo
        echo "Moving to /app/target-repo and running mvn clean javafx:run command to start project..."
        echo "After the project is built, the JavaFX application will be forwarded to VcXsrv."
        mvn clean javafx:run
        if [ $? -eq 0 ]; then
            echo "MVN ran the JavaFX application successfully."
        fi
    fi
fi

echo "Script execution completed."
