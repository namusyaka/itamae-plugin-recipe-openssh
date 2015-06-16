include_recipe "openssh::attributes"

def listen_addr_for(interface, type)
  interface_node = node['network']['interfaces'][interface]['addresses']
  interface_node.select { |_address, data| data['family'] == type }.keys[0]
end

node['openssh']['package_name'].each do |name|
  package name
end

template '/etc/ssh/ssh_config' do
  source 'templates/ssh_config.erb'
  mode '0644'
  owner 'root'
  group node['openssh']['rootgroup']
end

if node['openssh']['listen_interfaces']
  listen_addresses = [].tap do |a|
    node['openssh']['listen_interfaces'].each_pair do |interface, type|
      a << listen_addr_for(interface, type)
    end
  end

  node.set['openssh']['server']['listen_address'] = listen_addresses
end

template '/etc/ssh/sshd_config' do
  source 'templates/sshd_config.erb'
  mode node['openssh']['config_mode']
  owner 'root'
  group node['openssh']['rootgroup']
  notifies :restart, 'service[sshd]'
end

service 'ssh' do
  name node['openssh']['service_name']
  action [:enable, :start]
end
