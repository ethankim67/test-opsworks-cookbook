name 'awsdemo'
maintainer 'piljoong'
maintainer_email 'piljoong@amazon.com'
version '0.0.1'

recipe 'awsdemo::setup', 'Setup Java'
recipe 'awsdemo::install_tomcat', 'Install Tomcat'
recipe 'awsdemo::install_agent', 'Install the AWS CodeDeploy host agent'
recipe 'awsdemo::config_tomcat', 'Configure Tomcat'
