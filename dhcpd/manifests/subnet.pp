define dhcpd::subnet(
$config_file = '/etc/dhcpd.conf',
$network     = '',
$netmask     = '',
$options     = {},
$order       = '10',
$pools       = undef,
$ranges      = undef,
$next_server = undef,
$filename    = undef,
) {
  include dhcpd::params

  concat::fragment { "${order}_${name}_subnet_1":
    content => template('dhcpd/dhcpd_subnet_header.conf.erb'),
    target  => $config_file,
    order   => $order
  }
  if $pools {
    create_resources('dhcpd::pool', $pools, {config_file => $config_file, order => $order, subnet_name => $name})
  }
  concat::fragment { "${order}_${name}_subnet_3":
    content => template('dhcpd/dhcpd_subnet_end.conf.erb'),
    target  => $config_file,
    order   => $order
  }


}
