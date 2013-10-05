bash "start_scripts" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  cd /srv/www/node_development/current
  forever stopall

  EOH
end