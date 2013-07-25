bash "install_something" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  sudo yum install telnet
  sudo pecl install mongo
  cd /etc
  sudo sed -i -e '5iextension=mongo.so\' php.ini
  EOH
end