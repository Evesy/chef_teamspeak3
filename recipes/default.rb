#
# Cookbook Name:: chef_teamspeak3
# Recipe:: default
#
# Copyright 2016, Mike Eves
#
# All rights reserved - Do Not Redistribute
#

include_recipe "chef_teamspeak3::bzip2"

# Create teamspeak user & set non interactive shell
user "teamspeak" do
	action :create
	comment "Teamspeak User"
	shell "/sbin/nologin"
	home "/home/teamspeak"
end

# Download & extract teamspeak package

package = "teamspeak3-server_linux_amd64-#{node['ts3']['version']}"

remote_file "/home/teamspeak/#{package}.tar.bz2" do
	source "http://dl.4players.de/ts/releases/#{node['ts3']['version']}/#{package}.tar.bz2"
	owner "teamspeak"
	group "teamspeak"
end

execute "Extract package" do
	command "tar xvfj #{package}.tar.bz2 --strip 1"
	cwd "/home/teamspeak"
end

# Cleanup tar file & remove default startup
file "/home/teamspeak/#{package}.tar.bz2" do
	action :delete
end

file "/home/teamspeak/ts3server_minimal_runscript.sh" do
	action :delete
end

file "/home/teamspeak/ts3server_startscript.sh" do
	action :delete
end

# Create server ini file from template
template "/home/teamspeak/server.ini" do
	source "server.ini.erb"
	owner "teamspeak"
	group "teamspeak"
	mode "0644"

end
