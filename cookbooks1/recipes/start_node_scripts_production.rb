bash "start_node_scripts" do
  user "root"
  cwd "/srv/www/back_end/current"
  code <<-EOH
  cd /srv/www/back_end/current
  if [ -f decider.js ] && [ -f activityTypes.js ] && [ -f node.js ] && [ -f image_activityTypes.js ] && [ -f image_decider.js ]; then
  	forever stopall
  	kill -9 node
  	kill -9 sudo
  	sudo -s
  	
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log node.js
	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log decider.js
	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log activityTypes.js
	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log image_activityTypes.js
	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log image_decider.js
  fi
  EOH
end