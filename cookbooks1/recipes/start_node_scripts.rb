bash "start_scripts" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  cd /srv/www/node_development/current
  if [ -f decider.js ] && [ -f activityTypes.js ] && [ -f node.js ]; then
  	sudo forever start -w -l -a forever.log -o out.log -e err.log node.js
    sudo forever start -w -l -a forever.log -o out.log -e err.log decider.js
    sudo forever start -w -l -a forever.log -o out.log -e err.log activityTypes.js
  fi
  EOH
end