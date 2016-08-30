#
# Class: fetchcrl
#
# manages fetch-crl
#

class fetchcrl (
    $http_proxy          = $fetchcrl::params::http_proxy,
    $package_ensure      = $fetchcrl::params::package_ensure,
    $package_name        = $fetchcrl::params::package_name,
    $package_manage      = $fetchcrl::params::package_manage,
    $service_boot_enable = $fetchcrl::params::service_boot_enable,
    $service_boot_ensure = $fetchcrl::params::service_boot_ensure,
    $service_boot_manage = $fetchcrl::params::service_boot_manage,
    $service_cron_enable = $fetchcrl::params::service_cron_enable,
    $service_cron_ensure = $fetchcrl::params::service_cron_ensure,
    $service_cron_manage = $fetchcrl::params::service_cron_manage,
    ) inherits fetchcrl::params {

    validate_string($http_proxy)
    validate_string($package_ensure)
    validate_string($package_name)
    validate_bool($package_manage)
    validate_bool($service_boot_enable)
    validate_re($service_boot_ensure, ['^running$', '^stopped$'])
    validate_bool($service_boot_manage)
    validate_bool($service_cron_enable)
    validate_re($service_cron_ensure, ['^running$', '^stopped$'])
    validate_bool($service_cron_manage)

    class { 'fetchcrl::install': } ->
    class { 'fetchcrl::config': } ->
    class { 'fetchcrl::service': }

}
