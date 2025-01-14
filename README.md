## This is an automated backup and recovery exercise in a container
### Members of the group
- Nkwenti Severian
- Nyengka Prosper
- Nathan Joel
> Remember everything in this work requires absolute path.

To achieve this successfully, you need the following :

- To clone this repository
- Multipass instance
- A running docker container

You can install your multipass and run an instance using
```sh
sudo apt update && sudo apt install snapd && sudo snap install multipass && multipass launch docker --name ubuntu-vm
```
if you receive an error message use this command to verify if the instance ubuntu is running:
```
multipass list
```

Now you need to access this instance using this command:

```
multipass shell ubuntu-vm
```

You now run the command
```
sudo docker pull ubuntu
```
ubuntu is a docker image found on the dockerhub website, that supports bash shell environment.

Now you need to clone the repository containing the scripts and the Docker file 


```
sudo apt update && sudo apt install git -y && git clone https://github.com/Nkwenti-Severian-Ndongtsop/Automated_Backup_Recovery.git
```

Next you need to cd into the **Automated_Backup_Recovery** directory and build the docker file\
this file copies the two directories to the container 

use this command to build the file:

```
cd Automated_Backup_Recovery/ && sudo docker build -t test-image .
```

good\
you can use this to see the image. 
```
sudo docker images
```

We now have to run a container using that image

```
sudo docker run -it test-image bash
```

Excellent!

you need to now move the mock data into a directory for testing


```
mkdir -p /home/ubuntu/test/ && mv /home/ubuntu/file1 /home/ubuntu/test/ && mv /home/ubuntu/file2 /home/ubuntu/test/
```

Now run this to make the scripts executable

```
chmod +x back_up.sh && chmod +x recover.sh
```
You can execute the **back_up.sh** and then **recover.sh**\
You can check the logs after each execution\

```
./back_up.sh <directory>
```
```
./recover.sh
```
\<directory> is the full path of the directory to be back_up, in our case is **/home/ubuntu/test/**


the backup_folder is found in the /home/ubuntu/backup_folder\
feel free to play around.

you can help me evaluate the process based on this and drop any issue encountered in the process:
>**Requirements:**
>1. Set up a Docker container with a directory containing mock data files.
>2. Write a script to compress the data using `tar` and store it in a backup directory.
>3. Schedule the script to run automatically using a `cronjob`.
>4. Create a recovery script to extract the backup and restore the files to their original location.
>5. Log all backup and recovery actions for later review.

## For the cron job

You will create you cron job in the Automated backup directory before building the image\
always use the name **crontab** for the file because it was reference in the Docker file\
then it will be executed in the docker container, after you have build and ran the container

We used a file that runs backup every 2 minutes

run:
```
crontab /etc/cron.d/crontab && cron
```

To activate it you run
```
apt install nano && crontab -e
```

then press **ctrl o** and **enter** 
and also **ctrl x** to save and start the cron job 


you can wait for about 2 minutes and check the logs
