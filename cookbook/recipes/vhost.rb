directory "/srv/www/my_app/public/" do
  owner "deploy"
  group "www-data"
  recursive true
end

directory "/etc/apache2/sites-avaiable/my_app.conf.d/" do
  owner "root"
  group "root"
  mode 0644
  recursive true
end
