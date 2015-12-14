
java_home = node['java']['java_home']
jdk_url = node['java']['jdk_url']

ruby_block "set-env-java-home" do
  block do
    ENV["JAVA_HOME"] = java_home
  end
  not_if { ENV["JAVA_HOME"] == java_home }
end

file "/etc/profile.d/jdk.sh" do
  content <<-EOS
export JAVA_HOME=#{node['java']['java_home']}
EOS
  mode 0755
end

remote_file '/tmp/jdk.rpm' do
  source jdk_url
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

rpm_package 'jdk' do
  source '/tmp/jdk.rpm'
  action :install
end
  
package "tomcat7" do
  action :install
end

