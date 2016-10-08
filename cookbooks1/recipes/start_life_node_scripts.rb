bash "start_life_node_scripts" do
  user "root"
  cwd "/srv/www/back_end/current"
  code <<-EOH
  cd /srv/www/back_end/current
  if [ -f test.js ] && [ -f image_activityTypes.js ] && [ -f image_decider.js ]; then
  	forever stopall
    killall node
    killall sudo
  	sudo -s
  	
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log test.js
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log image_decider.js
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log image_activityTypes.js
  fi
  EOH
end
