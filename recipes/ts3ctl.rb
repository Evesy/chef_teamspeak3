# Provide our own control script to ensure server.ini is being passed
cookbook_file "/home/teamspeak/ts3ctl" do
        source "ts3_ctl"
        owner "teamspeak"
        group "teamspeak"
        mode "0744"
end

# Add systemd service to manage teamspeak
cookbook_file "/usr/lib/systemd/system/teamspeak.service" do
        source "ts3_service"
        mode "0644"
end

# Add teamspeak to startup
link "/etc/systemd/system/multi-user.target.wants/teamspeak.service" do
	to "/usr/lib/systemd/system/teamspeak.service"
end
