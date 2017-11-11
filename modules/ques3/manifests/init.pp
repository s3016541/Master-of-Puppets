# Class: ques3
# ===========================
#
# Full description of class ques3 here.
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
#    class { 'ques3':
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
class ques3 {

#install other packages needed for things

package { 'tcsh': ensure => installed }
package { 'openssl': ensure => installed }
package { 'augeas': ensure => installed }

package { 'openssh': ensure => installed }
package { 'httpd': ensure => installed }
package { 'mysql': ensure => installed }
package { 'tigervnc-server': ensure => installed }
package { 'tmux': ensure => installed }
package { 'dia2code': ensure => installed }
package { 'lynx': ensure => installed }
package { 'gcc': ensure => installed }
package { 'gdb': ensure => installed }
package { 'cgdb': ensure => installed }
package { 'vim': ensure => installed }
package { 'emacs': ensure => installed }
#package { 'fuse-sshfs': ensure => installed }
#package { 'fuse-sshfs': ensure => installed, require => Yumrepo['epel'] }


file { '/etc/ssh/sshd_config':
#  source  => 'puppet:///modules/sshd/sshd_config',
	owner	 => 'root',
	group	 => 'root',
	mode	 => '0640',
	notify	 => Service['sshd'], 
	require	 => Package['openssh'],
}

service { 'sshd': ensure => running, enable => true }
service { 'httpd': ensure  => running, enable => true }
service { 'tmux': ensure  => running, enable => true }

}
