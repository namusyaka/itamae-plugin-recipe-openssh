require 'spec_helper'

describe iptables do
  it { should have_rule('-A FORWARD -p tcp -m comment --comment "accept ssh" -m tcp --dport 2222 -j ACCEPT') }
end
