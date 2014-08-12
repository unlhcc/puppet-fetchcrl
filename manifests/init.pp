#
# Class: fetchcrl
#
# manages fetch-crl
#

class fetchcrl (
    $http_proxy = params_lookup( 'http_proxy' ),
    ) {

    if $::osfamily == 'RedHat' and $::operatingsystemrelease =~ /^5\..*/ {
        $pkgname = 'fetch-crl3'
    } else {
        $pkgname = 'fetch-crl'
    }

    package { $pkgname:
        ensure  => present,
    }

    service { 'fetch-crl-cron':
        ensure     => running,
        name       => 'fetch-crl-cron',
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Package[$pkgname],
        subscribe  => File['fetch-crl.conf'],
    }

    file { 'fetch-crl.conf':
        ensure  => present,
        path    => '/etc/fetch-crl.conf',
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => template('fetch_crl/fetch-crl.conf.erb'),
        require => Package[$pkgname],
    }

}
