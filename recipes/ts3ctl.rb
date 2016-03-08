case node['platform_family']
when "rhel"
	# Add systemd service to manage teamspeak
	template "/usr/lib/systemd/system/teamspeak.service" do
        	source "ts3_service.erb"
	        mode "0644"
		notifies :run, "execute[daemon-reload]", :immediately
	end

	# Reload daemon
	execute "daemon-reload" do
	        command "systemctl daemon-reload"
		action :nothing
	end

when "debian"
	# Add script to /etc/init.d/ that calls ts3ctl script as teamspeak user
	template "/etc/init.d/teamspeak" do
		source "ts3_init.erb"
		mode "0755"
	end
end

# Add teamspeak to startup
service "teamspeak" do
	action :enable
end


