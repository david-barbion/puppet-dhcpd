define dhcpd::pool(
$config_file                   = '',
$allow_members_of              = [],
$deny_members_of               = [],
$allow_known_clients           = false,
$deny_known_clients            = false,
$allow_unknown_clients         = false,
$deny_unknown_clients          = false,
$allow_dynamic_bootp_clients   = false,
$deny_dynamic_bootp_clients    = false,
$allow_all_clients             = false,
$deny_all_clients              = false,
$default_lease_time            = '',
$max_lease_time                = '',
$ranges                        = [],
$order                         = '10',
$subnet_name                   = ''
) {
  include dhcpd::params

  if $subnet_name == '' {
    fail('Need subnet name to attach to')
  }
  $_poolname = regsubst($title, ' ', '_', 'G')
  concat::fragment { "${order}_${subnet_name}_subnet_2_${_poolname}":
    content => template('dhcpd/dhcpd_subnet_pool.conf.erb'),
    target  => $config_file,
    order   => $order
  }
}
