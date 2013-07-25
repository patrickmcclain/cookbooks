bash "install_node" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  sudo npm install memcached
  sudo npm install mongodb
  sudo npm install pubnub
  EOH
end