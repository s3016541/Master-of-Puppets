# Class: ques4
# ===========================
#
# Full description of class ques4 here.
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
#    class { 'ques4':
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
class ques4 {

# disable root login for ssh

augeas { "disablerootforssh":  
        context => "/files/etc/ssh/sshd_config",  
        changes => "set PermitRootLogin no",  
	notify  =>  Service['sshd']  
}  

# change sudoers to allow becca to sudo to a root shell
#

file { "/etc/sudoers":
      owner   => "root",
      group   => "root",
      mode    => "440",
     }

 
augeas { "sudobecca":
	context => "/files/etc/sudoers",
	changes => [
	"set spec[user = 'becca']/user becca",
	"set spec[user = 'becca']/host_group/host ALL",
	"set spec[user = 'becca']/host_group/command ALL",
	"set spec[user = 'becca']/host_group/command/runas_user ALL",
	 ],
}


}