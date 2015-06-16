require 'spec_helper'

describe package('openssh-server'), unless: ["arch", "suse", "gentoo", "freebsd", "smartos"].include?(os[:family]) do
  it { should be_installed }
end

describe package('openssh-client'), unless: ["redhat", "fedora", "arch", "suse", "gentoo", "freebsd", "smartos"].include?(os[:family]) do
  it { should be_installed }
end

describe package('openssh-clients'), if: ["arch", "suse", "gentoo"].include?(os[:family]) do
  it { should be_installed }
end

describe package('openssh'), if: ["arch", "suse", "gentoo"].include?(os[:family]) do
  it { should be_installed }
end

describe service('sshd'), if: os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('ssh'), if: os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe file("/etc/ssh/ssh_config") do
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("/etc/ssh/sshd_config") do
  it { should be_mode 600 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match /\nPasswordAuthentication no/ }
  its(:content) { should match /\nPort 2222/ }
end
