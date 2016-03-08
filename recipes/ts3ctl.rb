# Add systemd service to manage teamspeak
template "/usr/lib/systemd/system/teamspeak.service" do
        source "ts3_service.erb"
        mode "0644"
end

# Add teamspeak to startup
service "teamspeak" do
	action :enable
end
