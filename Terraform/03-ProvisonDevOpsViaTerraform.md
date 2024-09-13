# Proposed Infra
<img width="942" alt="image" src="https://user-images.githubusercontent.com/75510135/130199577-ac81b0aa-5bfd-419a-af2e-13cc3e3ab0f1.png">

# manul installation of docker
- connect to EC2 instance
            ssh -i "connect-jerkins.pem" ec2-user@public-ip
- find instables
            sudo yum list | grep docker
- install docker
           
            sudo su
            sudo apt-get update
            
            # remove any package
            sudo apt-get remove docker docker-engine docker.io containerd runc
            
            # install package
            sudo apt-get install \
                apt-transport-https \
                ca-certificates \
                curl \
                gnupg \
                lsb-release
            #Docker’s official GPG key:
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
            
            # add stable repo
            echo \
            "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
            $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
            
            sudo apt-get update
            sudo apt-get install docker-ce docker-ce-cli containerd.io
            systemctl enable docker
            systemctl start docker
            usermod -aG docker ubuntu
            
            sudo docker run hello-world
            
- ALternative way 
```
              curl -fsSL https://get.docker.com -o get-docker.sh
              sudo sh get-docker.sh
```

# Install jenkins
```
mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home/
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11
# show endpoint
echo 'Jenkins installed'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'
```
- disk usage 
        df -h 

<img width="793" alt="image" src="https://user-images.githubusercontent.com/75510135/130176697-fa8907d6-b1fc-4dd5-90d6-6c6f328434de.png">

## to enable/start any service like jenkins
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              sudo chkconfig jenkins on
              sudo service jenkins status

# to interact with above created jenkins container
             docker container ls
             docker exec -it a8c825d981c1 bash


# User_data
- include InstallJenkins.sh while startup of vm
```
# Create an AWS EC2 Instance with any startup script

resource "aws_instance" "Jenkins" {
 # in case EC2 instance to be destroyed only , count=0
 // count = 0
  ami = var.ami
  instance_type = var.instance_type
  key_name = "connect-jerkins"
  vpc_security_group_ids = [aws_security_group.MyLab_Sec_Group.id]
  subnet_id = aws_subnet.MyLab-Subnet1.id
  associate_public_ip_address = true
  # include startup script
  user_data = file("./InstallJenkins.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}
```
- InstallJenkins.sh
```
#! /bin/bash
#install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install Git SCM
yum install git -y

#install jenkis
mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home/
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11
# show endpoint
echo 'Jenkins installed'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'

```
- user_data file will be located at below path
```
              cd /var/lib/cloud/instances/<instance-id>/
              ll
              cat user-data.txt
```              
- confirm the installation
```
              cd /var/log/
              ll
              tail -300f tail -300f cloud-init-output.log # look for transaction of docker/jenkins url
```
- jenkins passwrd 
```
docker container ls
> pick container id
docker exec -it <container-id> bash
cat /var/jenkins_home/secrets/initialAdminPassword
```
**kindly refer 02-Installation.md for futher setup of Jenkins**

# Setup Ansible
- https://4sysops.com/archives/how-to-deploy-ansible-inside-a-docker-container/

<img width="469" alt="image" src="https://user-images.githubusercontent.com/75510135/130194776-998f6eeb-72de-4402-8fa4-7b88bd6bb2a6.png">

- bash script to install Ansible
```
#! /bin/bash

# install ansible
yum-config-manager --enable epel
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install epel-release-latest-7.noarch.rpm
yum update -y
yum install python python-devel python-pip openssl ansible -y

sudo su -
# add the user ansible admin
sudo useradd ansibleadmin
# set password : the below command will avoid re entering the password
sudo echo "ansibleansible" | passwd --stdin ansibleadmin
# modify the sudoers file at /etc/sudoers and add entry
echo 'ansibleadmin     ALL=(ALL)      NOPASSWD: ALL' | sudo tee -a /etc/sudoers
echo 'ec2-user     ALL=(ALL)      NOPASSWD: ALL' | sudo tee -a /etc/sudoers
# this command is to add an entry to file : echo 'PasswordAuthentication yes' | sudo tee -a /etc/ssh/sshd_config
# the below sed command will find and replace words with spaces "PasswordAuthentication no" to "PasswordAuthentication yes"
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart
```
- terraform code to spin up EC2 instance for hosting ansible

```
# Create Ansible - an AWS EC2 Instance with startup script

resource "aws_instance" "AnsibleServer" {
 # in case EC2 instance to be destroyed only , count=0
  count = 0
  ami = var.ami
  instance_type = var.instance_type
  key_name = "connect-jerkins"
  vpc_security_group_ids = [aws_security_group.MyLab_Sec_Group.id]
  subnet_id = aws_subnet.MyLab-Subnet1.id
  associate_public_ip_address = true
  # include startup script
  user_data = file("./InstallAnsible.sh")

  tags = {
    Name = "Ansible-Server"
  }
}
```

# Spin Apache tomcat server


- script for Ansible
```
#! /bin/bash

# add the user ansible admin
useradd ansibleadmin
# set password : the below command will avoid re entering the password
echo "ansibleansible" | passwd --stdin ansibleadmin
# modify the sudoers file at /etc/sudoers and add entry
echo 'ansibleadmin     ALL=(ALL)      NOPASSWD: ALL' | sudo tee -a /etc/sudoers
echo 'ec2-user     ALL=(ALL)      NOPASSWD: ALL' | sudo tee -a /etc/sudoers
# this command is to add an entry to file : echo 'PasswordAuthentication yes' | sudo tee -a /etc/ssh/sshd_config
# the below sed command will find and replace words with spaces "PasswordAuthentication no" to "PasswordAuthentication yes"
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd restart
```
- setup ssh key for Ansible
**@ Ansible server(control node) , login using ansibleadmin
```
ssh-keygen 
cd /home/ansibleadmin/.ssh/
ll
ssh-copy-id apche-tomcat-server-ip
# test
ssh apche-tomcat-server-ip
```

# Setup Docker
- list users
              getent passwd | grep jack
 
 ```
     #! /bin/bash
    
    # add ansibleadmin user
    useradd ansibleadmin
    # set password for ansibleadmin
    echo "ansibleansible" | passwd --stdin ansibleadmin
    # set ansibleadmin as sudoers
    echo 'ansibleadmin     ALL=(ALL)      NOPASSWD: ALL' | sudo tee -a /etc/sudoers
    # set ec2-user as sudoers
    echo 'ec2-user     ALL=(ALL)      NOPASSWD: ALL' | sudo tee -a /etc/sudoers 
    # enable ssh passwordless authentication
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    service sshd restart

    # Install docker
    # Update the installed packages and package cache 
    yum update -y
    # Install the most recent Docker Engine package for Amazon Linux 2
    amazon-linux-extras install docker -y
    # Start the Docker service.
    service docker start
    # Add the ansibleadmin to the docker group so you can execute Docker commands without using sudo.
    usermod -a -G docker ansibleadmin
	# Configure Docker to start on boot
	sudo systemctl enable docker
	# Install docker-py
    sudo yum install python2-pip
    sudo pip2 install docker-py
 ```
 
 # Setup Sonarqube Nexus
 ```
 #! /bin/bash

# Install Java
yum install java-1.8.0-openjdk.x86_64 -y

# Update the packages
yum update –y
# Download Nexus
cd /opt/
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
# Unzip/Untar the compressed file
tar xf latest-unix.tar.gz
# Rename folder for ease of use
mv nexus-3.* nexus3
# Enable permission for ec2-user to work on nexus3 and sonatype-work folders
chown -R ec2-user:ec2-user nexus3/ sonatype-work/
# Create a file called nexus.rc and add run as ec2-user
cd /opt/nexus3/bin/
touch nexus.rc
echo 'run_as_user="ec2-user"' | sudo tee -a /opt/nexus3/bin/nexus.rc
# Add nexus as a service at boot time
ln -s /opt/nexus3/bin/nexus /etc/init.d/nexus
cd /etc/init.d
chkconfig --add nexus
chkconfig --levels 345 nexus on
# Start Nexus
service nexus start
```
 
 Nexus => admin / password
 
 <img width="802" alt="image" src="https://user-images.githubusercontent.com/75510135/130209955-227edf88-f367-43b3-9363-49b6c7ccd107.png">

# Configure Jenkins
- Dashboard
<img width="991" alt="image" src="https://user-images.githubusercontent.com/75510135/130211074-21b63a52-afa1-4be5-af13-92712e638331.png">
- click on Manage Jenkins
<img width="984" alt="image" src="https://user-images.githubusercontent.com/75510135/130211194-21e92ca3-960e-4b5f-bb3c-772d3f8c41e1.png">
- click on Manage Plugins
<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/130211314-385e87c4-4fb2-43e6-93e5-c4162995a4fe.png">
- configure plugin for GitHub(SCM), search "git" under "installed"
<img width="988" alt="image" src="https://user-images.githubusercontent.com/75510135/130211724-382ce4d1-0449-4fd3-a00e-9d490c854c9a.png">
- select NodeJs to configure nodejs plugin
<img width="984" alt="image" src="https://user-images.githubusercontent.com/75510135/130212012-aec9e129-6944-46a8-b7d5-2f1abef626c9.png">
**click on install without restart
<img width="684" alt="image" src="https://user-images.githubusercontent.com/75510135/130212198-93d9ab05-4100-4056-be40-30065fafb0b5.png">
- for maven 
<img width="976" alt="image" src="https://user-images.githubusercontent.com/75510135/130212276-fe8adf15-0198-4827-ab0c-5b639abd37f9.png">
<img width="734" alt="image" src="https://user-images.githubusercontent.com/75510135/130212384-82750688-8169-4ade-8de7-b03c38914a10.png">
- publish over ssh # to publish the artifacts
<img width="973" alt="image" src="https://user-images.githubusercontent.com/75510135/130212654-9a30efd9-3a18-4ed8-8752-54c61e716c8b.png">
<img width="485" alt="image" src="https://user-images.githubusercontent.com/75510135/130212814-75a648dd-35b1-43e7-9abd-d86ba774d38c.png">
- click on Manage Jenkins, then Global tool configuration

<img width="982" alt="image" src="https://user-images.githubusercontent.com/75510135/130213378-d9e8c0dd-65e7-4ea3-a162-05206776b555.png">
- configure Maven
<img width="968" alt="image" src="https://user-images.githubusercontent.com/75510135/130213543-dbb30761-697e-4a95-8df5-25b25fdfd591.png">
<img width="707" alt="image" src="https://user-images.githubusercontent.com/75510135/130213596-988ac8b1-a2d6-47a2-9654-080607039f91.png">
- nodejs 
<img width="988" alt="image" src="https://user-images.githubusercontent.com/75510135/130213766-17520b1b-6397-400f-b2c8-ab647e96ae34.png">




