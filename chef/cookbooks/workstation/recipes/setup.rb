package 'tree' do
	action :install
end

package 'ntp'

# node['ipaddress']
# node['moemory']['total']
# a =1
# puts "a = #{a}"

#file '/etc/motd' do
	#content "This server is the property of SHREYANK
	#IP-ADDRESS : #{node['ipaddress']}
	#MEMORY     : #{node['memory']['total']} "	
	#action :create
	#owner 'root'
	#group 'root'
#end

template '/etc/motd' do
	source 'motd.erb'
	variables(
		:name => 'shreyank')
	action :create
end
