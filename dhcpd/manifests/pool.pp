define dhcpd::pool(
$config_file           = '',
$allow_members_of      = '',
$allow_unknown_clients = true,
$default_lease_time    = '3600',
$max_lease_time        = '3600',
$ranges                = [],
$order                 = '11',
) {
  include dhcpd::params

  concat::fragment { "pool_${::name}":
    content => template('dhcpd/dhcpd_subnet_pool.conf.erb'),
    target  => $config_file,
    order   => $order
  }
}
