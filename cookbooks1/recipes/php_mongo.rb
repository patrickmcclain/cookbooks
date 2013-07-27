bash "install_something" do
  user "root"
  cwd "/home/ec2-user"
  code <<-EOH
  yum install telnet
  pecl install mongo
  cd /etc
  sed -i '5s/.*/extension=mongo.so/' php.ini
  service httpd restart
  EOH
end