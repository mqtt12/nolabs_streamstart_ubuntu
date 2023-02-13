-- https://www.youtube.com/watch?v=NtSd4IPjpLQ
 
# Creating a batch file!
 
# noalbs.sh
 
#!/bin/bash
cd /root/noalbs
./noalbs
 
#sls.sh
 
#!/bin/bash
cd /root/srt-live-server/bin/
./sls -c ../sls.conf
 
chmod +x noalbs.sh
chmod +x sls.sh
 
# These links are used as references when starting the services on "start up".
# https://mysystemd.talos.sh/
# https://www.shubhamdipt.com/blog/how-to-create-a-systemd-service-in-linux/
 
cd /etc/systemd/system
 
 
# noalbs.service
 
[Unit]
Description=noalbs
 
[Service]
ExecStart=/root/noalbs.sh
 
[Install]
WantedBy=multi-user.target
 
# sls.service
 
[Unit]
Description=sls
 
[Service]
ExecStart=/root/sls.sh
 
[Install]
WantedBy=multi-user.target
 
######
 
sudo systemctl daemon-reload
sudo systemctl start noalbs.service
sudo systemctl start sls.service
 
sudo systemctl status NAME-HERE.service
 
sudo systemctl enable noalbs.service
sudo systemctl enable sls.service
