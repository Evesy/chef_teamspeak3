#
# Cookbook Name:: chef_teamspeak3
# Recipe:: default
#
# Copyright 2016, Mike Eves
#
# All rights reserved - Do Not Redistribute
#

include_recipe "chef_teamspeak3::bzip2"

package = "teamspeak3-server_linux_amd64-#{node['ts3']['version']}"
install_dir = node['ts3']['install_dir']

# Create teamspeak user & set non interactive shell
user "teamspeak" do
	action :create
	comment "Teamspeak User"
	shell "/sbin/nologin"
end

directory install_dir do
	action :create
	owner "teamspeak"
	group "teamspeak"
	mode "0740"
end

# Download & extract teamspeak package

unless File.exist? "#{install_dir}/ts3server"
	remote_file "#{install_dir}/#{package}.tar.bz2" do
		source "http://dl.4players.de/ts/releases/#{node['ts3']['version']}/#{package}.tar.bz2"
		owner "teamspeak"
		group "teamspeak"
	end

	execute "Extract package" do
		command "tar xvfj #{package}.tar.bz2 --strip 1"
		cwd install_dir
	end

	# Cleanup tar file & remove default startup
	["#{install_dir}/#{package}.tar.bz2", "#{install_dir}/ts3server_minimal_runscript.sh", "#{install_dir}/ts3server_startscript.sh"].each do |i|
		file i do
			action :delete
		end 	
	end
end

# Create server ini file from template
template "#{install_dir}/server.ini" do
	source "server.ini.erb"
	owner "teamspeak"
	group "teamspeak"
	mode "0644"

end

# Provide our own control script to ensure server.ini is being passed
cookbook_file "#{install_dir}/ts3ctl" do
	source "ts3_ctl"
        owner "teamspeak"
        group "teamspeak"
        mode "0744"
end
                                 
