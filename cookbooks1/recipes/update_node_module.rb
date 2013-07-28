bash "install_node" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  npm install stripe-api
  EOH
end