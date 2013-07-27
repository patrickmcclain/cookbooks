bash "install_node" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  npm install forever -g
  npm install aws-sdk
  npm install aws2js
  npm install memcached
  npm install mongodb
  npm install pubnub
  npm install stripe
  cd /srv/www/node_development/current
  if [ -f decider.js ] && [ -f activityTypes.js ] && [ -f node.js ]; then
  	forever stopall
  	kill -9 node
  	kill -9 sudo
  	forever start -a -l /srv/www/node_development/current/forever.log -a -o /srv/www/node_development/current/out.log -a -e /srv/www/node_development/current/err.log node.js
	forever start -a -l /srv/www/node_development/current/forever.log -a -o /srv/www/node_development/current/out.log -a -e /srv/www/node_development/current/err.log decider.js
	forever start -a -l /srv/www/node_development/current/forever.log -a -o /srv/www/node_development/current/out.log -a -e /srv/www/node_development/current/err.log activityTypes.js
  fi
  EOH
end