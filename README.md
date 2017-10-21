# Master-of-Puppets

You will be presented with a set of criteria you need to apply to a system via Puppet Enterprise.

Tasks

1. User becca must exist on the system.
a. Her home directory needs to be managed and needs to be located in /home/becca.
b. She needs to be a member of the sysadmin and cars group.
c. Her password needs to be managed (and encrypted).
d. Her UID needs to be 1001 followed by the last four digits of your rmit student
number.
e. Her shell needs to be bash.

User fred must exist on the system.
a. His home directory needs to be managed and needs to be located in /home/fred.
b. He needs to be a member of the trucks and cars groups.
c. His password needs to be managed (and encrypted).
d. His UID needs to be 1002 followed by the last four digits of your rmit student
number.
e. His shell needs to be csh.

User wilma must exist on the system.
a. Her home directory needs to be managed and needs to be located in /home/wilma.
b. She needs to be a member of trucks, cars, and ambulances.
c. Her password needs to be managed and encrypted.
d. Create an ssh key for her and manage it with puppet (the creation of the key does
not have to be in puppet but key needs to be managed with puppet).
e. Her UID needs to be 1003 followed by the last four digits of your rmit student
number.

2. Configure your puppet agent to check in three times per hour. There are two ways to do
this, both ways need to use Puppet’s management framework. Manual changes to
configuration files will attract a mark of 0 here. 

3. You need to ensure the following packages are installed and come up on boot (at run level 3).
a. openssh
b. Apache (called httpd in many distributions)
c. MySQL Server (may be called something else …) and MySQL Client
d. vncserver
e. tmux
f. dia2code
g. lynx
h. gcc
i.  gdb
j.  cgdb
k. vim
l.  emacs
m. sshfs

4. You must manage the configuration files for each of these packages.
a. You need to disable root logins for SSH.
b. Apache’s document root needs to be /var/www/sXXXXXXX, where sXXXXXXX is
your rmit login id.
c. sudoers must allow becca to sudo to a root shell. You must achieve this through
management of the sudoer file
d. fred is also required to be able to sudo to root but in this case you must achieve this
using groups, not modification of the sudoers file.
e. Ensure /usr/local/bin is in everyone's path on the system.
f. Ensure that your titan home directory is mounted over sshfs in becca's home
directory as /home/becca/titan.

5. You need to create a host record.
Ensure host records for titan, jupiter and saturn are set up so the user can ssh just using
the word titan, jupiter or saturn and not the whole address.

6. Whenever the agent runs on a client, output the message (on the client) “Agent run starting
at <time>”. You will need to prove that this is printed in the puppet log to get full marks for
this.

7. Ensure /usr/local/bin is in everyone's path on the system.

8. For all the services you installed in part 3, ensure each service subscribes to the file
(eg: service restarts if files change)..
