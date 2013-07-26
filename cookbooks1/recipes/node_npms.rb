bash "install_node" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  sudo npm install forever -g
  sudo npm install aws-sdk
  sudo npm install aws2js
  sudo npm install memcached
  sudo npm install mongodb
  sudo npm install pubnub
  sudo npm install stripe
  cd /srv/www/node_development/current
  if [ -f decider.js ] && [ -f activityTypes.js ] && [ -f node.js ]; then
  	sudo forever stopall
  	sudo forever start -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log node.js
	sudo forever start -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log decider.js
	sudo forever start -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log activityTypes.js
  fi
  EOH
end