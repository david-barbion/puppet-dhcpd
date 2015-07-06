class dhcpd::service {
  include dhcpd::params
  service { $::dhcpd::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  # This exec tests the dhcpd config and fails if it's bad
  # It isn't run every time puppet runs, but only when dhcpd is to be restarted
  exec { 'dhcpd-config-test':
    command     => '/usr/bin/sudo /usr/sbin/dhcpd -q -t',
    returns     => 0,
    refreshonly => true,
    logoutput   => on_failure,
    notify      => Service[$::dhcpd::params::service_name],
  }

}
