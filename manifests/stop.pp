# == Class: start
#
# Takes care of stopping different level services.
# Internal use only.
#
# === Parameters
#
#	None
#
# === Authors
#
# Mandar Pise <mandar_pise@symantec.com>
#
# === Copyright
#
# Copyright 2015 Mandar Pise, unless otherwise noted.
#
class sfha::stop {
	info("Inside sfha::stop class")

	exec { 'sfha-stop':
		path => '/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/VRTSvcs/bin:/opt/VRTSperl/bin',
		command => '/etc/init.d/vcs stop && /etc/init.d/gab stop && /etc/init.d/llt stop',
		unless => "ps -ef | grep had | grep -v grep ",
		
	}

}
