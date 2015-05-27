# == Class: start
#
# Takes care of starting different stack level services.
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
class sfha::start {
	info("Inside sfha::start class")

	exec { 'sfha-start':
		path => '/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/VRTSvcs/bin:/opt/VRTSperl/bin',
		command => '/etc/init.d/llt start && /etc/init.d/gab start && /etc/init.d/vcs start',
		unless => "ps -ef | grep had | grep -v grep",
		
	}

}
