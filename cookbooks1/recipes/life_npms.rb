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
  if [ -f test.js ] && [ -f image_activityTypes.js ] && [ -f image_decider.js ]; then
  	forever stopall
    kill -9 node
    kill -9 sudo
  	sudo -s
  	
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log test.js
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log image_decider.js
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log image_activityTypes.js
  fi
  EOH
end
