# Pulling Ubuntu image
FROM ubuntu:latest

# Update packages and install cron
RUN apt-get update && apt-get install -y \
    cron \
    bash && \
    apt-get clean
    
# Setting up work directory
WORKDIR /home/ubuntu

# Copy the script into the container
COPY . /home/ubuntu/

# move job to the cron.d
RUN mv /home/ubuntu/crontab /etc/cron.d/

# apply the cron job
RUN crontab /etc/cron.d/crontab

# Start the cron service
CMD ["cron", "-f"]
