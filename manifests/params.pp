#
# Class: fetchcrl::params
#

class fetchcrl::params {

    $http_proxy          = undef
    $package_ensure      = 'present'
    $package_manage      = true
    $service_boot_enable = true
    $service_boot_ensure = 'running'
    $service_boot_manage = true
    $service_cron_enable = true
    $service_cron_ensure = 'running'
    $service_cron_manage = true

    case $::operatingsystemmajrelease {
        '5' : {
            $package_name = 'fetch-crl3'
        }

        default : {
            $package_name = 'fetch-crl'
        }
    }

}
