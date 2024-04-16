FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven && \
    rm -rf /var/lib/apt/lists/*

# Install additional packages for X11 forwarding

RUN apt-get update && apt-get install --no-install-recommends -y xorg libgl1-mesa-glx && rm -rf /var/lib/apt/lists/* 


# Set the DISPLAY environment variable for X11 forwarding
ENV DISPLAY=:0

# Set the working directory
WORKDIR /app

# Copy the JavaDockerContainerAutoPull directory
COPY JavaDockerContainerAutoPull /app/JavaDockerContainerAutoPull

# Change working directory to the JavaDockerContainerAutoPull directory
WORKDIR /app/JavaDockerContainerAutoPull

# Build the Java project using Maven
RUN mvn clean package

# Move the built JAR file to the /app directory
RUN mv target/JavaDockerContainerAutoPull-1.0-SNAPSHOT.jar /app

# Set the working directory back to /app
WORKDIR /app

# Copy a script that runs the JAR and executes a bash command after it finishes
COPY bashScript.sh /app/bashScript.sh

# Give execute permissions to the script AND fix the bash file with extra scripts :3
RUN chmod +x /app/bashScript.sh
RUN apt-get update && apt-get install -y dos2unix
RUN dos2unix /app/bashScript.sh

# Specify the command to run on container startup
CMD ["/app/bashScript.sh"]
