# == Class: sfha
#
# Install and configure SFHA products
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
#
# === Examples
#
#node 'rhel7-n1' {
#	class { 'sfha':
#		server_name => ["rhel7-n1", "rhel7-n2"],
#		clusterid => "36240",
#		stack_name => "VCS62",
#		clus_configure => "1",
#		operation =>"installed",
#		#operation =>"absent",
#	}
#}
#
# === Authors
#
# Mandar Pise <mandar_pise@symantec.com>
#
# === Copyright
#
# Copyright 2015 Mandar Pise, unless otherwise noted.
#
class sfha (
	$version = $sfha::meta::version,
	$total_nodes = $sfha::meta::total_nodes,
	$clusterid = $sfha::meta::clusterid,
	$product = $sfha::meta::product,
	$product_install_dir = $sfha::meta::product_install_dir,
	$product_log_dir = $sfha::meta::product_log_dir,
	$install_path=$sfha::meta::install_path,
	$stack_name= $stack_name,
	$clus_configure= $clus_configure,
	$server_name = $::fqdn,
	$operation = $operation,
	$link1="eth0",
	$link2="eth1",
	$link3="eth3",

)inherits sfha::meta
{
	class {	'sfha::install':
		version => $version,
		total_nodes => $total_nodes,
		product => $product,
		product_install_dir => $product_install_dir,
		product_log_dir => $product_log_dir,
		install_path => $install_path,
		stack_name => $stack_name,
		operation => $operation,
	}

	class { 'sfha::config':
		server_name => $server_name,
		clusterid => $clusterid,
		clus_configure => $clus_configure,
		link1 => $link1,
		link2 => $link2,
		link3 => $link3,
		
	}
	
	### This is futures
	### We plan to configure and start cluster eventually
	#class {	'sfha::start':} 
	#class {	'sfha::stop':} 
}
