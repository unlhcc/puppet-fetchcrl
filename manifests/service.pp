#
# Class: fetchcrl::service
#

class fetchcrl::service inherits fetchcrl {

    if $fetchcrl::service_boot_manage == true {
        service { 'fetch-crl-boot':
            ensure     => $fetchcrl::service_boot_ensure,
            name       => 'fetch-crl-boot',
            enable     => $fetchcrl::service_boot_enable,
            hasrestart => true,
            hasstatus  => true,
            require    => Class['fetchcrl::config'],
        }
    }

    if $fetchcrl::service_cron_manage == true {
        service { 'fetch-crl-cron':
            ensure     => $fetchcrl::service_cron_ensure,
            name       => 'fetch-crl-cron',
            enable     => $fetchcrl::service_cron_enable,
            hasrestart => true,
            hasstatus  => true,
            require    => Class['fetchcrl::config'],
        }
    }

}