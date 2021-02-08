#!/bin/sh

set -e

pkpass={{ shibbolethidp_keystore_password }}
storepass={{ shibbolethidp_keystore_password }}
keystore={{ shibbolethidp_idp_home }}/credentials/ssl-keystore.jks

umask 077

[ -z "$RENEWED_LINEAGE" ] && cd /etc/letsencrypt/live/{{ shibbolethidp_fqdn }} || cd "$RENEWED_LINEAGE"

openssl pkcs12 -export \
	-inkey privkey.pem -in fullchain.pem \
	-out ssl-keystore.pkcs12 -passout "pass:$pkpass"

keytool -importkeystore -noprompt \
	-srckeystore ssl-keystore.pkcs12 -srcstoretype PKCS12 -srcstorepass "$pkpass" \
	-destkeystore ssl-keystore.jks -deststorepass "$storepass"

chown jetty:jetty ssl-keystore.jks
chmod 550 ssl-keystore.jks
[ -f $keystore ] && mv "$keystore" "$(dirname "${keystore}")/$(date +%Y%m%d)-$(basename "${keystore}")"
mv ssl-keystore.jks "$keystore"

systemctl restart shibboleth-idp
