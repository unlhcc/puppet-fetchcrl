#
# Class: fetchcrl::install
#

class fetchcrl::config inherits fetchcrl {

    file { 'fetch-crl.conf':
        ensure  => present,
        path    => '/etc/fetch-crl.conf',
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => template('fetchcrl/fetch-crl.conf.erb'),
        require => Class['fetchcrl::install'],
    }

}