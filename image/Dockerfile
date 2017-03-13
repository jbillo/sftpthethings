FROM ubuntu:16.04
RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y libpam-ldap nscd openssh-server supervisor
RUN mkdir -p /var/run/sshd /var/log/supervisor /sftproot
RUN chown root.root /sftproot
RUN rm -rf /etc/ldap.d
COPY ldap.conf /etc/
COPY ldap.secret /etc/
COPY nsswitch.conf /etc/
COPY common-session /etc/pam.d/
COPY supervisord.conf /etc/supervisord.conf
COPY sshd_config /etc/ssh/sshd_config

# VOLUME /sftproot
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

