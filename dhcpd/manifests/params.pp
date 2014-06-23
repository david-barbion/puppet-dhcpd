# == Class: dhcpd::params
#
# Params for dhcpd modules
#
# === Authors
#
# David Barbion <david.barbion@ext.leroymerlin.fr>
#
class dhcpd::params {
  $package_name = 'dhcp'
  $service_name = 'dhcpd'
  $config_file  = '/etc/dhcpd.conf'
}
