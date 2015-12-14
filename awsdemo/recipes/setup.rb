

#arch = node['jdk']['arch']
#jdk_version = node['jdk']['version']
build = 17
arch = 'x64'
jdk_version = '1.8.0_66'
checksum = '7e95ad5fa1c75bc65d54aaac9e9986063d0a442f39a53f77909b044cef63dc0a'

jdk = "jdk-#{jdk_version}-linux-#{arch}.tar.gz"

download_url = "http://download.oracle.com/otn-pub/java/jdk/#{jdk_version}-b#{build}/#{jdk}"


unless file_cache_path
  Chef::Log.info("file_cacche_path is undefined")
  file_cache_path = ::File.join(Chef::Config[:file_cache_path], jdk)

  chef_gem 'allow for https to http redirections' do
    package_name 'open_uri_redirections'
    version '0.2.1'
    complete_time false if Chef::Resource::ChefGem.method_defined?(:compile_time)
  end

  Chef::Log.info("download #{download_url}")
  ruby_block "fetch #{download_url}" do
    block do
      JavaSE::Downloader.fetch(download_url, file_cache_path)
    end
    not_if { ::File.exists?(file_cache_path) && JavaSE::Downloader.valid?(file_cache_path, checksum) }
  end
end

ruby_block "validate #{file_cache_path}" do
  block do
    JavaSE::Downloader.validate(file_cache_path, checksum)
  end
end

  

package "tomcat7" do
  action :install
end

