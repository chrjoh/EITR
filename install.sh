#!/bin/sh

red='\e[1;31m'
grn='\e[1;32m'
blu='\e[1;34m'
mag='\e[1;35m'
cyn='\e[1;36m'
white='\e[0m'

if ! [ $(id -u) != 0 ]; then
   echo $red"Do not run as root. Script will sudo as needed."$white
   echo ""
   exit 1
fi

init_sys() {
	clear
	echo ""
	seq -s= 65|tr -d '[:digit:]'
	echo $cyn"This script provisions a host to be used for pentesting labs"
	echo "and CTF games, such as HackTheBox and VulnHub. It consists of"
	echo "tools and configurations that I have consistently used and many"
	echo "extras that others may find useful for various situations."
	echo ""
	echo "It is especially useful if you require persistence and/or prefer"
	echo "to use a remote host, such as AWS, rather than a local VM."
	echo ""$white
	echo $mag"Twitter: @0xValkyrie"
	echo "GitHub: https://github.com/0xValkyrie"$white
	seq -s= 65|tr -d '[:digit:]'
	echo ""

	echo $blu"Press enter to initialize and deploy system."$white
	read continue

	echo $blu"Preparing to update system..."$white
	sudo apt -y update ;

	echo ""
	echo $blu"Upgrading system packages..."$white
	echo ""
	sudo apt -y install snmp php-curl netdiscover postgresql ruby-dev build-essential gnupg2 libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev libgmp-dev zlib1g-dev libssl-dev libffi-dev python-dev;
	sudo apt -y full-upgrade;

	echo ""
	echo $blu"Cleaning up..."$white
	sudo apt -y -qq autoremove > /dev/null 2>&1;
	sudo apt -y -qq autoclean > /dev/null 2>&1;
	echo ""
}

provision() {
	echo $blu"Installing additional packages..."$white

	if test ! $(which ufw); then
		echo $grn "* Installing ufw" $white
		sudo apt -y -qq install ufw > /dev/null 2>&1;
		else echo $red "* ufw is already installed" $white
	fi

	if test ! $(which nginx); then
		echo $grn "* Installing nginx" $white
		sudo apt -y -qq install nginx > /dev/null 2>&1;
		else echo $red "* nginx is already installed" $white
	fi

	if test ! $(which apache2); then
		echo $grn "* Installing apache2" $white
		sudo apt -y -qq install apache2 > /dev/null 2>&1;
		else echo $red "* apache2 is already installed" $white
	fi

	if test ! $(which nmap); then
		echo $grn "* Installing nmap" $white
		sudo apt -y -qq install nmap > /dev/null 2>&1;
		else echo $red "* nmap is already installed" $white
	fi

	if test ! $(which zmap); then
		echo $grn "* Installing zmap" $white
		sudo apt -y -qq install zmap > /dev/null 2>&1;
		else echo $red "* zmap is already installed" $white
	fi	

	if test ! $(which html2text); then
		echo $grn "* Installing html2text" $white
		sudo apt -y -qq install html2text > /dev/null 2>&1;
		else echo $red "* html2text is already installed" $white
	fi

	if test ! $(which hashcat); then
		echo $grn "* Installing hashcat" $white
		sudo apt -y -qq install hashcat > /dev/null 2>&1;
		else echo $red "* hashcat is already installed" $white
	fi

	if test ! $(which hashid); then
		echo $grn "* Installing hashid" $white
		sudo apt -y -qq install hashid > /dev/null 2>&1;
		else echo $red "* hashid is already installed" $white
	fi
	
	if test ! $(which python); then
		echo $grn "* Installing python" $white
		sudo apt -y -qq install python > /dev/null 2>&1;
		else echo $red "* python is already installed" $white
	fi

	if test ! $(which pip); then
		echo $grn "* Installing python-pip" $white
		sudo apt -y -qq install python-pip > /dev/null 2>&1;
		else echo $red "* python-pip is already installed" $white
	fi

	if test ! $(which python3); then
		echo $grn "* Installing python3" $white
		sudo apt -y -qq install python3 > /dev/null 2>&1;
		else echo $red "* python3 is already installed" $white
	fi

	if test ! $(which pip3); then
		echo $grn "* Installing python3-pip" $white
		sudo apt -y -qq install python3-pip > /dev/null 2>&1;
		else echo $red "* python3-pip is already installed" $white
	fi

	if test ! $(which curl); then
		echo $grn "* Installing curl" $white
		sudo apt -y -qq install curl > /dev/null 2>&1;
		else echo $red "* curl is already installed" $white
	fi

	if test ! $(which wget); then
		echo $grn "* Installing wget" $white
		sudo apt -y -qq install wget > /dev/null 2>&1;
		else echo $red "* wget is already installed" $white
	fi

	if test ! $(which git); then
		echo $grn "* Installing git" $white
		sudo apt -y -qq install git > /dev/null 2>&1;
		else echo $red "* git is already installed" $white
	fi

	if test ! $(which ruby); then
		echo $grn "* Installing ruby" $white
		sudo apt -y -qq install ruby > /dev/null 2>&1;
		else echo $red "* ruby is already installed" $white
	fi

	if test ! $(which rake); then
		echo $grn "* Installing rake" $white
		sudo apt -y -qq install rake > /dev/null 2>&1;
		else echo $red "* rake is already installed" $white
	fi

	if test ! $(which nodejs); then
		echo $grn "* Installing nodejs" $white
		sudo apt -y -qq install nodejs > /dev/null 2>&1;
		else echo $red "* nodejs is already installed" $white
	fi	

	if test ! $(which make); then
		echo $grn "* Installing make" $white
		sudo apt -y -qq install make > /dev/null 2>&1;
		else echo $red "* make is already installed" $white
	fi	

	if test ! $(which go); then
		echo $grn "* Installing golang" $white
		sudo apt -y -qq install golang > /dev/null 2>&1;
		else echo $red "* golang is already installed" $white
	fi	 

	if test ! $(which cargo); then
		echo $grn "* Installing cargo" $white
		sudo apt -y -qq install cargo > /dev/null 2>&1;
		else echo $red "* cargo is already installed" $white
	fi

	if test ! $(which openssl); then
		echo $grn "* Installing openssl" $white
		sudo apt -y -qq install openssl > /dev/null 2>&1;
		else echo $red "* openssl is already installed" $white
	fi	

	if test ! $(which socat); then
		echo $grn "* Installing socat" $white
		sudo apt -y -qq install socat > /dev/null 2>&1;
		else echo $red "* socat is already installed" $white
	fi

	if test ! $(which openvpn); then
		echo $grn "* Installing openvpn" $white
		sudo apt -y -qq install openvpn > /dev/null 2>&1;
		else echo $red "* openvpn is already installed" $white
	fi

	if test ! $(which dirb); then
		echo $grn "* Installing dirb" $white
		sudo apt -y -qq install dirb > /dev/null 2>&1;
		else echo $red "* dirb is already installed" $white
	fi

	if test ! $(which nikto); then
		echo $grn "* Installing nikto" $white
		sudo apt -y -qq install nikto > /dev/null 2>&1;
		else echo $red "* nikto is already installed" $white
	fi
	echo""

	echo $blu"Checking status of metasploit-framework..."$white	
	if test ! $(which msfconsole); then
		echo $grn "* Not found, installing" $white
		curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall;
		chmod 755 /tmp/msfinstall;
		/tmp/./msfinstall;
		sudo rm /tmp/msfinstall;
		echo ""
		echo $blu"Initializing database for user and root..."$white	
		msfdb init;
		echo $blu"Enter 'exit' when you see the msf5> prompt"$white	
		msfconsole -q;
		sudo mkdir /root/.msf4;
		sudo cp ~/.msf4/database.yml /root/.msf4/database.yml;
		else echo $red "* metasploit-framework is already installed" $white
	fi
	echo""

	echo $blu"Installing wpscan and updating database..."$white
	sudo gem install wpscan > /dev/null 2>&1;
	sudo wpscan --update > /dev/null 2>&1;
	echo ""

	echo $blu"Creating directories..."$white

	if [ -d ~/machines ]; then
		echo $red "* ~/machines already exists"$white

		else
			mkdir ~/machines > /dev/null 2>&1;
			sudo mkdir /root/machines > /dev/null 2>&1;
			echo $grn "* Creating ~/machines"$white
	fi

	if [ -d ~/recon ]; then
		echo $red "* ~/recon already exists"$white
		
		else
			mkdir ~/recon > /dev/null 2>&1;
			sudo mkdir /root/recon > /dev/null 2>&1;
			echo $grn "* Creating ~/recon"$white
	fi

	if [ -d ~/enumeration ]; then
		echo $red "* ~/enumeration already exists"$white

		else
			mkdir ~/enumeration > /dev/null 2>&1;
			sudo mkdir /root/enumeration > /dev/null 2>&1;
			echo $grn "* Creating ~/enumeration"$white
	fi	
	echo ""

	echo $blu"Cloning recon scripts..."$white;
	sudo curl -s "https://gist.githubusercontent.com/0xValkyrie/0e123d8c89b2c7edd72e4a7072c69bce/raw/8de961c7958212ceea9b6a900517ea96b57dd986/scan.sh" > ~/recon/autoscan.sh;
	sudo curl -s "https://gist.githubusercontent.com/0xValkyrie/0e123d8c89b2c7edd72e4a7072c69bce/raw/8de961c7958212ceea9b6a900517ea96b57dd986/msfauto.sh" > ~/recon/intensive_scan.sh;
	sudo curl -s "https://gist.githubusercontent.com/0xValkyrie/0e123d8c89b2c7edd72e4a7072c69bce/raw/dedf9200bc8c615769743a067ce701716edeb6fb/deploy.py" > ~/git_clone.py;
	sudo curl -s "https://gist.githubusercontent.com/0xValkyrie/0e123d8c89b2c7edd72e4a7072c69bce/raw/dedf9200bc8c615769743a067ce701716edeb6fb/repos.csv" > ~/repos.csv;

	sudo chmod +x ~/recon/autoscan.sh;
	sudo chmod +x ~/recon/intensive_scan.sh;
	sudo cp ~/recon/autoscan.sh /root/recon/autoscan.sh;
	sudo cp ~/recon/intensive_scan.sh /root/recon/intensive_scan.sh;
	echo ""

	echo $blu"Cloning repositories..."$white;
	sudo python ~/git_clone.py;
	echo ""

	echo $blu"Building masscan..."$white;
	cd /opt/masscan;
	sudo make -j > /dev/null 2>&1;
	sudo cp /opt/masscan/bin/masscan /usr/local/bin/masscan;
	cd ~/;
	echo ""

	echo $blu"Installing CrackMapExec..."$white;
	sudo pip install crackmapexec > /dev/null 2>&1;
	sudo pip3 install crackmapexec > /dev/null 2>&1;
	echo ""

	echo $blu"Installing Empire..."$white;
	sudo /opt/Empire/setup/install.sh > /dev/null 2>&1;
	sudo pip install -r /opt/Empire/setup/requirements.txt > /dev/null 2>&1;
	sudo pip3 install -r /opt/Empire/setup/requirements.txt > /dev/null 2>&1;
	echo ""

	echo $blu"Compiling gobuster..."$white;
	export PATH=$PATH:/usr/local/go/bin;
	bash -c "source ~/.profile";
	cd /opt/gobuster;
	sudo go get > /dev/null 2>&1;
	sudo go build > /dev/null 2>&1;
	sudo make -j > /dev/null 2>&1;
	sudo cp gobuster /usr/local/bin/gobuster;
	cd ~/;
	echo ""

	echo $blu"Installing pspy..."$white;
	cd /opt/SharpShooter;
	sudo pip install -r requirements.txt > /dev/null 2>&1;
	sudo pip3 install -r requirements.txt > /dev/null 2>&1;
	cd ~/;
	echo ""

	echo $blu"Building sslscan..."$white;
	sudo /opt/sslscan/build_openssl_debian.sh > /dev/null 2>&1;
	echo ""

	echo $blu"Installing requirements for theHarvester..."$white;
	cd /opt/theHarvester;
	sudo pip3 install -r requirements.txt > /dev/null 2>&1;
	sudo pip install -r requirements.txt > /dev/null 2>&1;
	cd ~/;
	echo ""

	echo $blu"Installing requirements for wfuzz..."$white;
	cd /opt/wfuzz;
	sudo pip3 install -r requirements.txt > /dev/null 2>&1;
	sudo pip install -r requirements.txt > /dev/null 2>&1;
	cd ~/;
	echo ""

	echo $blu"Configuring firewall to allow SSH..."$white;
	sudo ufw allow ssh > /dev/null
	sudo ufw enable;
	echo ""

	echo $cyn"Cleaning up..."$white;
	sudo cp /opt/LinEnum/LinEnum.sh ~/enumeration/LinEnum.sh;
	sudo cp /opt/linux-exploit-suggester/linux-exploit-suggester.sh ~/enumeration/linux-exploit-suggester.sh;
	sudo cp /opt/linuxprivchecker/linuxprivchecker.py ~/enumeration/linuxprivchecker.py;
	sudo cp /opt/LinEnum/LinEnum.sh /root/enumeration/LinEnum.sh;
	sudo cp /opt/linux-exploit-suggester/linux-exploit-suggester.sh /root/enumeration/linux-exploit-suggester.sh;
	sudo cp /opt/linuxprivchecker/linuxprivchecker.py /root/enumeration/linuxprivchecker.py;
	sudo rm ~/git_clone.py;
	sudo rm ~/repos.csv;
	sudo apt -y autoremove > /dev/null 2>&1;
	sudo apt -y autoclean > /dev/null 2>&1;
	sudo rm -r bomutils/ go/ openssl/;
	echo ""

	echo $cyn"System fully deployed. Run msfconsole and scripts as root."$white;
	echo ""

	echo $grn"Press enter to clear terminal. Happy hacking!"$white;
	read continue;
	clear;
}

init_sys
provision
