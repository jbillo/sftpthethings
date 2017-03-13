#!/bin/bash -e
docker run --name ldap-service --hostname ldap-service --detach \
  --volume /opt/slapd/database:/data/slapd/database \
  --volume /opt/slapd/config:/data/slapd/config \
  osixia/openldap:1.1.8 || true
docker run --name phpldapadmin-service --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host --detach osixia/phpldapadmin:0.6.12 || true

PHPLDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" phpldapadmin-service)

echo "Go to: https://$PHPLDAP_IP"
echo "Login DN: cn=admin,dc=example,dc=org"
echo "Password: admin"

docker run --name sftpthethings --hostname sftpthethings --link ldap-service:ldap-host -p 44022:22 --detach \
	--volume /opt/sftproot:/sftproot \
	jbillo/sftpthethings:latest
