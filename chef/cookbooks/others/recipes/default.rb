#
# Cookbook:: others
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#notifies :action 'resource[name]', :timer '
#subscribes :
package 'httpd'

cookbook_file '/var/www/html/index.html' do
	source 'index.html'
	action :create
	#notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
	action [:enable, :start]
	subscribes :restart, 'cookbook_file[/var/www/html/index.html]', :immediately
end

user 'not_root' do
	comment 'this is not a root user'
	uid '123'
	home '/home/not_root'
	shell '/bin/bash'	
end

group 'admins' do
	members 'not_root'
end
