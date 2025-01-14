# Pulling Ubuntu image
FROM ubuntu:latest

# Update packages and install cron
RUN apt-get update && apt-get install -y cron

# Setting up work directory
WORKDIR /home/ubuntu

# Copy the script into the container
COPY . /home/ubuntu/

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Add the cron job to the crontab
RUN crontab -e -l | { echo "*/1 * * * * /home/ubuntu/back_up.sh >> /var/log/cron.log 2>&1"; } | crontab -

# Start the cron service
CMD ["cron", "-f"]