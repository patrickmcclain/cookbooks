bash "start_scripts" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  cd /srv/www/node_development/current
  forever stopall
  kill -9 node
  kill -9 sudo
  EOH
end