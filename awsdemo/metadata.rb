name 'awsdemo'
version '1.0.0'

recipe 'awsdemo::setup', 'Setup Java'
recipe 'awsdemo::install_tomcat', 'Install Tomcat'
recipe 'awsdemo::install_agent', 'Install the AWS CodeDeploy host agent'
