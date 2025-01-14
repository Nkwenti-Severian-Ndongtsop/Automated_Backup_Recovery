# Pulling Ubuntu image
FROM ubuntu:latest

# Update packages and install cron
RUN apt-get update && apt-get install -y cron

# Setting up work directory
WORKDIR /home/ubuntu

# Copy the script into the container
COPY . /home/ubuntu/

# Start the cron service
CMD ["cron", "-f"]
