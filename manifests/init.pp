#
# Class: fetchcrl
#
# manages fetch-crl
#

class fetchcrl (
    Optional[Stdlib::HTTPUrl]         $http_proxy          = undef,
    String                            $package_ensure      = 'present',
    Boolean                           $package_manage      = true,
    String                            $package_name        = 'fetch-crl',
    Boolean                           $service_boot_enable = true,
    Optional[Stdlib::Ensure::Service] $service_boot_ensure = undef,
    Boolean                           $service_boot_manage = true,
    Boolean                           $service_cron_enable = true,
    Stdlib::Ensure::Service           $service_cron_ensure = 'running',
    Boolean                           $service_cron_manage = true,
) {

    # Install
    if $package_manage == true {
        package { $package_name:
            ensure  => $package_ensure,
        }
    }

    # Configure
    file { 'fetch-crl.conf':
        ensure  => present,
        path    => '/etc/fetch-crl.conf',
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => template('fetchcrl/fetch-crl.conf.erb'),
    }

    # Run
    if $service_boot_manage == true {
        service { 'fetch-crl-boot':
            # Default to false. If a CRL server is down, startup will fail.
            ensure     => $service_boot_ensure,
            enable     => $service_boot_enable,
            hasrestart => true,
        }
    }
    if $service_cron_manage == true {
        service { 'fetch-crl-cron':
            ensure     => $service_cron_ensure,
            enable     => $service_cron_enable,
            hasrestart => true,
        }
    }

}
