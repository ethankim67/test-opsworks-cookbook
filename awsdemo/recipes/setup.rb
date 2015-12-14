

#arch = node['jdk']['arch']
#jdk_version = node['jdk']['version']
#build = 17
#arch = 'x64'
#jdk_version = '1.8.0_66'
#checksum = '7e95ad5fa1c75bc65d54aaac9e9986063d0a442f39a53f77909b044cef63dc0a'
file_cache_path = 1

#jdk = "jdk-#{jdk_version}-linux-#{arch}.tar.gz"

#download_url = "http://download.oracle.com/otn-pub/java/jdk/#{jdk_version}-b#{build}/#{jdk}"

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

remote_file '/tmp/jdk.tar.gz' do
  source jdk_url
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


#java_ark "jdk" do
#  url jdk_url
#  app_home java_home
#  bin_alternatives_priority 1062
#  action :install
#end


#ruby_block "validate #{file_cache_path}" do
#  block do
#    JavaSE::Downloader.validate(file_cache_path, checksum)
#  end
#end

  

#package "tomcat7" do
#  action :install
#end

