bash "start_scripts" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  cd /srv/www/node_development/current
  if [ -f decider.js ] && [ -f activityTypes.js ] && [ -f node.js ]; then
  	sudo forever stopall
  	sudo forever start -w -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log node.js
	sudo forever start -w -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log decider.js
	sudo forever start -w -a -l /srv/www/node_development/current/forever.log node.js -o /srv/www/node_development/current/out.log -e /srv/www/node_development/current/err.log activityTypes.js
  fi
  EOH
ends