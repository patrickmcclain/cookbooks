bash "install_something" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  sudo yum install telnet
  sudo pecl install mongo
  cd /etc
  sed -i '5s/.*/extension=mongo.so/' php.ini
  EOH
end