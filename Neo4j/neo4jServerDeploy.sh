# Update system files
apt-get update
apt-get install -y sudo

# Install dependencies
sudo apt-get install -y git
sudo apt-get install -y openjdk-7-jdk

# Git all files
git clone https://github.com/ellipsonic/neo4j.git
cd neo4j
pubilc_ip=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
sudo sed -i ''s/org.neo4j.server.webserver.address=0.0.0.0/org.neo4j.server.webserver.address=$pubilc_ip/g'' conf/neo4j-server.properties
bin/neo4j start
