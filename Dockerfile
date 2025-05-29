FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven xorg libgl1 dos2unix --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*


# Set the DISPLAY environment variable for X11 forwarding
ENV DISPLAY=:0

# Set the working directory
WORKDIR /app

# Copy the JavaFX-DAP directory
COPY JavaFX-DAP /app/JavaFX-DAP

# Change working directory to the JavaFX-DAP directory
WORKDIR /app/JavaFX-DAP

# Build the Java project using Maven
RUN mvn clean package

# Move the built JAR file to the /app directory
RUN mv target/JavaFX-DAP-1.0-SNAPSHOT.jar /app

# Set the working directory back to /app
WORKDIR /app

# Copy a script that runs the JAR and executes a bash command after it finishes
COPY bashScript.sh /app/bashScript.sh

# Give execute permissions to the script AND fix the bash file with extra scripts
RUN chmod +x /app/bashScript.sh && \
    dos2unix /app/bashScript.sh

# Specify the command to run on container startup
CMD ["/app/bashScript.sh"]
