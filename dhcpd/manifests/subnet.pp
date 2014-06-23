define dhcpd::subnet(
$config_file= '',
$network    = '',
$netmask    = '',
$options    = {},
$order      = '10',
$pools      = undef,
) {
  include dhcpd::params

  concat::fragment { "subnet_${name}_start":
    content => template('dhcpd/dhcpd_subnet_header.conf.erb'),
    target  => $config_file,
    order   => $order
  }
  if $pools {
    create_resources('dhcpd::pool', $pools, {config_file => $config_file, order => $order+1})
  }
  concat::fragment { "subnet_${name}_end":
    content => template('dhcpd/dhcpd_subnet_end.conf.erb'),
    target  => $config_file,
    order   => $order+2
  }


}
