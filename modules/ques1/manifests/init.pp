# Class: ques1
# ===========================
#
# Full description of class ques1 here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ques1':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class ques1 {

#creating users

user { 'becca':
	ensure => 'present',
	home => '/home/becca',
	managehome => 'true',		
 	groups => ['sysadmin', 'cars'],
	uid => '10016541',
	shell => 'bin/bash',
}

user { 'fred':
	ensure => 'present',
	home => '/home/fred',
	managehome => 'true',
	groups => ['trucks', 'cars'],
	
	uid => '10026541',
	shell => 'bin/csh',
}

user { 'wilma':
	ensure => 'present',
	home => '/home/fred',
	managehome => 'true',	
	groups => ['trucks', 'cars', 'ambulances'],

	uid => '10036541'
}

#creating groups

group { 'sysadmin':
	ensure => 'present',
	gid => '501'
}

group { 'trucks':
        ensure => 'present',
        gid => '502'
}

group { 'cars':
        ensure => 'present',
        gid => '503'
}

group { 'ambulances':
        ensure => 'present',
        gid => '504'
}

}