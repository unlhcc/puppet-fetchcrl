#
# Class: fetchcrl::install
#

class fetchcrl::install inherits fetchcrl {

    if $fetchcrl::package_manage == true {

        package { $fetchcrl::package_name:
            ensure  => $fetchcrl::package_ensure,
        }

    }

}