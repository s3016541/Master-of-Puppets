# Class: ques5
# ===========================
#
# Full description of class ques5 here.
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
#    class { 'ques5':
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
class ques5 {

#create host record for rmit titan, jupiter and saturn


file { '/root/.ssh':
    ensure => 'directory',
}

file { '/root/.ssh/config':
	ensure	=> "present",
	owner	=> "root",
	group   => "root",
	mode    => "440",
     
	content => [ 'host titan
	HostName titan.csit.rmit.edu.au
	User s3016541

host jupiter
	HostName jupiter.csit.rmit.edu.au 
       	User s3016541
host saturn
       	HostName saturn.csit.rmit.edu.au 
       	User s3016541
	' ],
}


}
