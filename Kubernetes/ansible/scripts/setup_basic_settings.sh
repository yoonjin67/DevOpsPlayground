#!/bin/bash
# Args: debian or ubuntu supported
OPERATING_SYSTEM="$1"
echo "$OPERATING_SYSTEM"

sudo apt-get update -y

# Ansible is managed by ppa:ansible/ansible.
# We should add ansible repo
if [ "$OPERATING_SYSTEM" = "ubuntu" ]
then
	# First, we need to install Python3 PIP package
	sudo apt-get install python3-pip -y
	# Install software-properties-common pacakge to 
	# manage PPAs (third-party sources) easier.
	sudo add-apt-repository --yes --update ppa:ansible/ansible

	sudo apt-get install software-properties-common -y
elif [ "$OPERATING_SYSTEM" = "debian" ]
then
	echo "Your Choise is debian"
	UBUNTU_CODENAME="jammy"
	wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" \
	| sudo gpg --dearmour -o \
	/usr/share/keyrings/ansible-archive-keyring.gpg

	echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" \
       	| sudo tee /etc/apt/sources.list.d/ansible.list
fi
	
# Sync before installation
sudo apt-get update -y

# Install Ansible
sudo apt-get install ansible -y

# Ansible needs basic Kubernetes setup to use kubectl.

bash "$(SCRIPTS "$K8S_PLAYGROUND/basic_init")/init.sh"
