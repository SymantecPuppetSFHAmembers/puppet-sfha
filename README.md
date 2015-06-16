# puppet-sfha

This is the SFHA module for puppet.
Supports installation of SFHA stack using YUM on RHEL7

## Usage:

Basic requirement is SFHA yum repository configured on individual nodes (Use product DVD for YUM repo configuration)

``` puppet
node 'rhel7-n1' {
	class { 'sfha':
		### Need to specify cluster node order
		### The order must be maintained
		server_name => ["rhel7-n1", "rhel7-n2"],
		clusterid => "36240",
		### Supported stack names VCS62 and SFHA62
		stack_name => "VCS62",
		### Cluster configuration is not yet supported, set to 0
		clus_configure => "0",
		### operation accepts two values
		### absent - removes all SFHA packages
		### installed - installs all SFHA packages
		operation =>"installed",
	}
}
```

## License
-------
'Apache License, Version 2.0'

## Contact
-------
Mandar Pise < mandar_pise@symantec.com > 

## Support
-------
1. SFHA release support
	- SFHA 6.2
 
2. Operating Systems supported
	- RHEL7

3. Product YUM repositories supported (Use product DVD for YUM repo configuration on individual nodes)
	- VCS62 
	- SFHA62

4. Deploys sample /etc/llttab and /etc/gabtab files on cluster nodes if clus_configure set to 1

If there are issues found in the solution, feel free to log them at [Projects site](https://github.com/SymantecPuppetSFHAmembers/puppet-sfha) and the author will assess and provide fixes
at his/her own discretion.
