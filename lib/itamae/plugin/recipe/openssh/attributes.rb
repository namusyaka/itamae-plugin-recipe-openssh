node["openssh"]["server"] ||= {}
node["openssh"]["client"] ||= {}
node["openssh"]["server"]["port"] ||= 22

node['openssh']['package_name'] ||=
  case node['platform_family']
  when 'rhel', 'fedora'
    %w(openssh-clients openssh-server)
  when 'arch', 'suse', 'gentoo'
    %w(openssh)
  when 'freebsd', 'smartos'
    %w()
  else
    %w(openssh-client openssh-server)
  end

node['openssh']['service_name'] ||=
  case node['platform_family']
  when 'rhel', 'fedora', 'suse', 'freebsd', 'gentoo', 'arch'
    'sshd'
  else
    'ssh'
  end

node['openssh']['config_mode'] ||=
  case node['platform_family']
  when 'rhel', 'fedora'
    '0600'
  else
    '0644'
  end

node['openssh']['rootgroup'] ||=
  case node['platform_family']
  when 'freebsd'
    'wheel'
  else
    'root'
  end

node['openssh']['client']['host'] ||= '*'
# node['openssh']['client']['forward_agent'] ||= 'no'
# node['openssh']['client']['forward_x11'] ||= 'no'
# node['openssh']['client']['rhosts_rsa_authentication'] ||= 'no'
# node['openssh']['client']['rsa_authentication'] ||= 'yes'
# node['openssh']['client']['password_authentication'] ||= 'yes'
# node['openssh']['client']['host_based_authentication'] ||= 'no'
# node['openssh']['client']['gssapi_authentication'] ||= 'no'
# node['openssh']['client']['gssapi_delegate_credentials'] ||= 'no'
# node['openssh']['client']['batch_mode'] ||= 'no'
# node['openssh']['client']['check_host_ip'] ||= 'yes'
# node['openssh']['client']['address_family'] ||= 'any'
# node['openssh']['client']['connect_timeout'] ||= '0'
# node['openssh']['client']['strict_host_key_checking'] ||= 'ask'
# node['openssh']['client']['identity_file'] ||= '~/.ssh/identity'
# node['openssh']['client']['identity_file_rsa'] ||= '~/.ssh/id_rsa'
# node['openssh']['client']['identity_file_dsa'] ||= '~/.ssh/id_dsa'
# node['openssh']['client']['port'] ||= '22'
# node['openssh']['client']['protocol'] ||= [ '2 1' ]
# node['openssh']['client']['cipher'] ||= '3des'
# node['openssh']['client']['ciphers'] ||= [ 'aes128-ctr aes192-ctr aes256-ctr arcfour256 arcfour128 aes128-cbc 3des-cbc' ]
# node['openssh']['client']['macs'] ||= [ 'hmac-md5 hmac-sha1 umac-64@openssh.com hmac-ripemd160' ]
# node['openssh']['client']['escape_char'] ||= '~'
# node['openssh']['client']['tunnel'] ||= 'no'
# node['openssh']['client']['tunnel_device'] ||= 'any:any'
# node['openssh']['client']['permit_local_command'] ||= 'no'
# node['openssh']['client']['visual_host_key'] ||= 'no'
# node['openssh']['client']['proxy_command'] ||= 'ssh -q -W %h:%p gateway.example.com'
# sshd config group
# node['openssh']['server']['port'] ||= '22'
# node['openssh']['server']['address_family'] ||= 'any'
# node['openssh']['server']['listen_address'] ||= [ '0.0.0.0 ::' ]
# node['openssh']['server']['protocol'] ||= '2'
# node['openssh']['server']['host_key_v1'] ||= '/etc/ssh/ssh_host_key'
# node['openssh']['server']['host_key_rsa'] ||= '/etc/ssh/ssh_host_rsa_key'
# node['openssh']['server']['host_key_dsa'] ||= '/etc/ssh/ssh_host_dsa_key'
if node['platform_family'] == 'smartos'
  node['openssh']['server']['host_key'] ||= ['/var/ssh/ssh_host_rsa_key', '/var/ssh/ssh_host_dsa_key']
end
# node['openssh']['server']['host_key_ecdsa'] ||= '/etc/ssh/ssh_host_ecdsa_key'
# node['openssh']['server']['key_regeneration_interval'] ||= '1h'
# node['openssh']['server']['server_key_bits'] ||= '1024'
# node['openssh']['server']['syslog_facility'] ||= 'AUTH'
# node['openssh']['server']['log_level'] ||= 'INFO'
# node['openssh']['server']['login_grace_time'] ||= '2m'
# node['openssh']['server']['permit_root_login'] ||= 'yes'
# node['openssh']['server']['strict_modes'] ||= 'yes'
# node['openssh']['server']['max_auth_tries'] ||= '6'
# node['openssh']['server']['max_sessions'] ||= '10'
# node['openssh']['server']['r_s_a_authentication'] ||= 'yes'
# node['openssh']['server']['pubkey_authentication'] ||= 'yes'
# node['openssh']['server']['authorized_keys_file'] ||= '%h/.ssh/authorized_keys'
# node['openssh']['server']['rhosts_r_s_a_authentication'] ||= 'no'
# node['openssh']['server']['host_based_authentication'] ||= 'no'
# node['openssh']['server']['ignore_user_known_hosts'] ||= 'no'
# node['openssh']['server']['ignore_rhosts'] ||= 'yes'
# node['openssh']['server']['password_authentication'] ||= 'yes'
# node['openssh']['server']['permit_empty_passwords'] ||= 'no'
node['openssh']['server']['challenge_response_authentication'] ||= 'no'
# node['openssh']['server']['kerberos_authentication'] ||= 'no'
# node['openssh']['server']['kerberos_or_localpasswd'] ||= 'yes'
# node['openssh']['server']['kerberos_ticket_cleanup'] ||= 'yes'
# node['openssh']['server']['kerberos_get_afs_token'] ||= 'no'
# node['openssh']['server']['gssapi_authentication'] ||= 'no'
# node['openssh']['server']['gssapi_clean_up_credentials'] ||= 'yes'
node['openssh']['server']['use_p_a_m'] ||= 'yes' unless node['platform_family'] == 'smartos'
# node['openssh']['server']['allow_agent_forwarding'] ||= 'yes'
# node['openssh']['server']['allow_tcp_forwarding'] ||= 'yes'
# node['openssh']['server']['gateway_ports'] ||= 'no'
# node['openssh']['server']['x11_forwarding'] ||= 'no'
# node['openssh']['server']['x11_display_offset'] ||= '10'
# node['openssh']['server']['x11_use_localhost'] ||= 'yes'
# node['openssh']['server']['print_motd'] ||= 'yes'
# node['openssh']['server']['print_last_log'] ||= 'yes'
# node['openssh']['server']['t_c_p_keep_alive'] ||= 'yes'
# node['openssh']['server']['use_login'] ||= 'no'
# node['openssh']['server']['use_privilege_separation'] ||= 'yes'
# node['openssh']['server']['permit_user_environment'] ||= 'no'
# node['openssh']['server']['compression'] ||= 'delayed'
# node['openssh']['server']['client_alive_interval'] ||= '0'
# node['openssh']['server']['client_alive_count_max'] ||= '3'
# node['openssh']['server']['use_dns'] ||= 'yes'
# node['openssh']['server']['pid_file'] ||= '/var/run/sshd.pid'
# node['openssh']['server']['max_startups'] ||= '10'
# node['openssh']['server']['permit_tunnel'] ||= 'no'
# node['openssh']['server']['chroot_directory'] ||= 'none'
# node['openssh']['server']['banner'] ||= 'none'
# node['openssh']['server']['subsystem'] ||= 'sftp /usr/libexec/sftp-server'
node['openssh']['server']['match'] ||= {}
