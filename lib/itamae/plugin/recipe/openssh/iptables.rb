require 'itamae/plugin/resource/iptables_rule'
require 'itamae/plugin/resource/iptables_save'

include_recipe "openssh::default"

iptables_rule('accept ssh') do
  action :accept
  chain "FORWARD"
  protocol "tcp"
  dport node['openssh']['server']['port']
end

iptables_save '/etc/iptables.rules'
