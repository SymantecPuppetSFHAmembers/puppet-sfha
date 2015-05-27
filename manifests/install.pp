# == Class: install
#
# Performs installation/uninstallation of SFHA products
# Internal use only.
#
# === Parameters
#
# [*version*]
#   SFHA version to install
#
# [*total_nodes*]
#   Number of nodes in cluster
#
# [*clusterid*]
#   Unique cluster id to use
#
# [*product*]
#   Individual SFHA product to install
#
# [*product_install_dir*]
#   Product directory to install
#
# [*product_log_dir*]
#   Product log directory 
#
# [*product_log_dir*]
#   Product log directory 
#
# [*stack_name*]
#   Product stack to install from SFHA family
#
# [*clus_configure*]
#   Decides if manifest proceeds with installation
#
# [*server_name*]
#   cluster nodes to install SFHA products
#
# [*operation*]
#   Operation manifest would like to perform viz. installed Vs absent ( uninstallation )
#
# === Authors
#
# Mandar Pise <mandar_pise@symantec.com>
#
# === Copyright
#
# Copyright 2015 Mandar Pise, unless otherwise noted.
#
class sfha::install(
	$version = $sfha::meta::version,
	$total_nodes =$sfha::meta::total_nodes,
	$product = $sfha::meta::product,
	$product_install_dir = $sfha::meta::product_install_dir,
	$product_log_dir = $sfha::meta::product_log_dir,
	$install_path=$sfha::meta::install_path,
	$stack_name= $stack_name,
	$operation = $operation,
)
{
	case $::operatingsystem {
		'RedHat' :{
			$dvd_type='dvd1-redhatlinux'
		}
		'SuSe' :{
			$dvd_type='dvd2-suselinux'
		}
		default: {
			fail("Module {$module_name} is not supported on ${::operatingsystem}")
		}
	}	

	### If operation is marked for 'installation'
	if $operation == "installed"{	
		exec { 'yum stack install':
		   unless => "/usr/bin/yum grouplist $stack_name | /usr/bin/grep -i \"^Installed groups\"",
		   command => "/usr/bin/yum -y groupinstall $stack_name",

		}
		### Following exec required as yum group does not clearly identifies manually uninstalled packages from the group
		exec { 'yum missing install':
		  command => "/usr/bin/yum -y install `/usr/bin/yum -v groupinfo $stack_name | /usr/bin/grep 'VRTS' | grep -v '@' | /usr/bin/awk '{print \$1}' | /usr/bin/cut -c 2-` ",
		  unless => "/usr/bin/yum -v groupinfo $stack_name | /usr/bin/grep 'VRTS' | grep -v '@' | /usr/bin/awk '{print \$1}' | /usr/bin/cut -c 2- | exit `wc -l`",
		}

	### If operation is marked for 'uninstallation'
	} elsif $operation == "absent" {
		exec { 'yum stack uninstall':
		   unless => "/usr/bin/yum grouplist $stack_name | /usr/bin/grep \"^Installed Groups\"",
		   command => "/usr/bin/yum -y groupremove $stack_name",
		}

	}

}
