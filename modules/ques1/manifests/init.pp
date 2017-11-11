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
	shell => '/bin/bash',
	password => generate('/bin/sh', '-c', "openssl passwd -1 -salt verysalty secretpassword | tr -d '\n'"),
}

user { 'fred':
	ensure => 'present',
	home => '/home/fred',
	managehome => 'true',
	groups => ['trucks', 'cars'],
		password => generate('/bin/sh', '-c', "openssl passwd -1 -salt verysalty secretpassword | tr -d '\n'"),
	uid => '10026541',
	shell => '/bin/csh',
}

user { 'wilma':
	ensure => 'present',
	home => '/home/wilma',
	managehome => 'true',
	password => generate('/bin/sh', '-c', "openssl passwd -1 -salt verysalty secretpassword | tr -d '\n'"),
	groups => ['trucks', 'cars', 'ambulances', 'sshdragon'],

	uid => '10036541'
}

#creating groups

group { 'sysadmin':
	ensure => 'present',
	gid => '5001'
}

group { 'trucks':
        ensure => 'present',
        gid => '5002'
}

group { 'cars':
        ensure => 'present',
        gid => '5003'
}

group { 'ambulances':
        ensure => 'present',
        gid => '5004'
}

group { 'sshdragon':
	ensure => 'present',
	gid => '5005'
}

#ssh keys for users

file { "/home/wilma":
	ensure => directory,
	owner =>'wilma',
	group => 'sshdragon',
	mode => '0750',
	require =>  [ User['wilma'], Group['sshdragon'] ],
}


# add the .ssh folder to user
file { "/home/wilma/.ssh":
	ensure => directory,
	owner => 'wilma',
	group => 'sshdragon',
	mode => '0700',
	#require =>  File["/home/wilma"],
}

ssh_authorized_key { 'wilma_ssh':
	ensure => 'present',
	user => 'wilma',
	type => 'ssh-rsa',
	key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCmqW384YX35bV9Mv+QOqh3EQG8QvB7hQH2aYhUPg0xJxa62Yus9sBTFXFqi1vRwqWbkE3rT7VZxr9BBMbFJdJR9Mj3UaSz2XVA0ZruWmyxjg6Q3Yozj2fLgcaajJbNFObh4dm2ooWvwUYn39Ruiu6q29rtoFbbjySAdEkcv3ZRksBdpTmcL+rz22xV2aYUu7CUDUmfnkDNh1zI2k6b/8Ls+C8RN+uMja7ODxv7SZ4Qr12Liotsu6/MEpTKB/tEVAE7LSwbbNLuCgkbv2OGoURXQosaj1ndM+oZhHlYrrVlzDGm9EsBLHE8y6W69CqfyPQYxxk/TSD1CmrP6YQ9R6Lt',
}







}
