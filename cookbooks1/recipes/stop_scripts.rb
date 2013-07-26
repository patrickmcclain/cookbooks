bash "start_scripts" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  cd /srv/www/node_development/current
  sudo forever stopall
  sudo kill -9 node
  sudo kill -9 sudo
  EOH
end