bash "start_life_node_scripts" do
  user "root"
  cwd "/srv/www/back_end/current"
  code <<-EOH
  cd /srv/www/node_development/current
  if [ -f test.js ]; then
  	forever stopall
    kill -9 node
    kill -9 sudo
  	sudo -s
  	
  	forever start -a -l /srv/www/back_end/current/forever.log -a -o /srv/www/back_end/current/out.log -a -e /srv/www/back_end/current/err.log test.js
  fi
  EOH
