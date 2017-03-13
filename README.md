# sftpthethings
Experiments with Docker and SFTP

# get started
* on your docker host, create /opt/sftponly
* mount directories with RO permissions under this root (/sftponly on container, appears as / to sftponly users)
* run `/bringup.sh` to get containers initialized
* access https://127.0.0.1:44443/ and log in with username `cn=admin,dc=example,dc=org` and password `admin`
* if it's your first time configuring LDAP, take a quick look at https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-a-basic-ldap-server-on-an-ubuntu-12-04-vps and do the following:
 * create a `ou=groups,dc=example,dc=org` OU
 * create a `ou=users,dc=example,dc=org` OU
 * create a `cn=sftponly,ou=groups,dc=example,dc=org` POSIX group under the `groups` OU
 * create a `cn=sftpuser,ou=users,dc=example,dc=org` generic user account under the `users` OU and put it in the `sftponly` group
* try to SSH to the sftp container: `ssh -p 44022 sftpuser@127.0.0.1` and confirm that it only allows sftp access
* try to sftp to the container: `sftp -p44022 sftpuser@127.0.0.1` and confirm that you can see the files under `/`
  
