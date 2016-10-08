bash "install_node" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  yum -y install GraphicsMagick.x86_64
  npm install forever -g
  npm install aws-sdk
  npm install express
  npm install orientjs
  npm install request
  npm install body-parser
  cd /srv/www/back_end/current
  if [ -f test.js ]; then
  	forever stopall
    killall node
    killall sudo
  	sudo -s
  	
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log test.js
  fi
  EOH
end
