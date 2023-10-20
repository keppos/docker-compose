# Use OpenJDK 11
FROM openjdk:11

# Set working directory to /app
WORKDIR /app

# Copy the current directory contents into /app
COPY . /app

# Compile java program
COPY HelloWorld.java /app
RUN javac HelloWorld.java

# Install Python
RUN apt-get update
RUN apt-get install -y python3

# Create shell script to run both programs
RUN echo '#!/bin/sh' > run.sh
RUN echo 'java HelloWorld' >> run.sh
RUN echo 'python3 hello.py' >> run.sh
RUN chmod +x run.sh

# Run the shell script as the entry point
CMD ["sh", "run.sh"]