# postfix + spamassassin

## Is postfix running chroot?

Defaults to false for postfix >= 3
Setting is in /etc/postfix/master.cf
See the `smtp` line, under `chroot`

If so, other resources it accesses must reside below its chroot
which by default is (/var/spool/postfix)

# spamassassin user and group

Debian has `debian-spamd`
Default is `spamd`

Ensure spamass-milter is in the spamassassin user's group.
