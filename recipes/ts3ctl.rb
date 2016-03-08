# Add systemd service to manage teamspeak
template "/usr/lib/systemd/system/teamspeak.service" do
        source "ts3_service.erb"
        mode "0644"
	notifies :run, "execute[daemon-reload]", :immediately
end

# Add teamspeak to startup
service "teamspeak" do
	action :enable
end

# Reload daemon
execute "daemon-reload" do
	command "systemctl daemon-reload"
	action :nothing
end

