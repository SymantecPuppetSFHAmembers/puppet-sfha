# == Class: meta
#
# Default attributes for SFHA products
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
class sfha::meta {
	$version = "6.2"
	$clusterid = "36250"
	$total_nodes ="2"
	$product = "SFHA"
	$product_install_dir = "/opt"
	$product_log_dir = "/var"
	$clus_configure = "0"
}
