
service "tomcat7" do
  supports :restrart => true, :status => true, :reload => true
  action [:start]
end
