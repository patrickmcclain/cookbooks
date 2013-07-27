bash "start_node_scripts" do
  user "root"
  cwd "/srv/www/node_development/current"
  code <<-EOH
  cd /srv/www/node_development/current
  if [ -f decider.js ] && [ -f activityTypes.js ] && [ -f node.js ]; then
  	sudo forever stopall
  	sudo kill -9 node
  	sudo kill -9 sudo
  	forever start -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log node.js
	forever start -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log decider.js
	forever start -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log activityTypes.js
  fi
  EOH
end