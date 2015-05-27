# == Class: config
#
# This class defines configuration settings for SFHA products
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
class sfha::config (
	$version = $sfha::meta::version,
	$clusterid = $sfha::meta::clusterid,
	$total_nodes = $sfha::meta::total_nodes,
	$product = $sfha::meta::product,
	$product_install_dir = $sfha::meta::product_install_dir,
	$product_log_dir = $sfha::meta::product_log_dir,
	$install_path = $sfha::meta::install_path,
	$stack_name = $stack_name,
	$clus_configure = $clus_configure,
	$server_name = [$::server_name],
	$link1 = $::link1,
	$link2 = $::link2,
	$link3 = $::link3,
)inherits sfha::meta
{
### Invoke cluster configuration here
### Cluster configuration STARTS

	$path ="/etc"
	$LLTHOSTS="llthosts"
	$LLTHOSTS_FILE="/etc/${LLTHOSTS}"
	$LLTTAB="/etc/llttab"	
	$GABTAB="/etc/gabtab"
	$VXFENTAB="/etc/vxfentab"

	define cluster_config_files($cluster_file_path){

		file { "$cluster_file_path/$title":
			ensure => file,
			mode => '0644',
			content => template("$module_name/header.erb","$module_name/$title.erb"),
		}

	}
	
	if $clus_configure == "1" {	
		### 1. Create /etc/llthost file from template
		cluster_config_files { llthosts: cluster_file_path=>$path}
		cluster_config_files { llttab: cluster_file_path=>$path}
		### 2. Create /etc/gabtab file from template
		cluster_config_files { gabtab: cluster_file_path=>$path}
	}
		
### Cluster configuration ENDS
}
