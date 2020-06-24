package 'httpd' do
	action :install
end

#file '/var/www/html/index.html' do
#	content "<h1>Hello, world!</h1></br>
#		 <h2> #{node['hostname']} </h2></br>
#		 <h2> #{node['ipaddress']} </h2>"
#end

remote_file '/var/www/html/one.jpg' do
	source 'https://cdn.eso.org/images/thumb700x/eso1907a.jpg'
end

template '/var/www/html/index.html' do
	source 'index.html.erb'
	action :create
end

#bash "inline script" do
#	user 'root'
#	code "mkdir -p /var/www/mysites/ && chwon -R apache /var/www/mysites/"
#	not_if '[-d /var/www/mysites/]'
#	not_if do
#		File.directory?("/var/www/mysites")
#	end
#end	

service 'httpd' do
	action [:enable,:start ]
end
