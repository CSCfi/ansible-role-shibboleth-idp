#!/bin/sh

set -e

            pkpass={{ shibbolethidp_keystore_password }}
            storepass={{ shibbolethidp_keystore_password }}
            keystore={{ shibbolethidp_idp_home }}/credentials/ssl-keystore.jks

            umask 077

            cd "$RENEWED_LINEAGE"

            openssl pkcs12 -export \
             -inkey privkey.pem -in fullchain.pem \
             -out ssl-keystore.pkcs12 -passout "pass:$pkpass"

            keytool -importkeystore -noprompt \
             -srckeystore ssl-keystore.pkcs12 -srcstoretype PKCS12 -srcstorepass "$pkpass" \
             -destkeystore ssl-keystore.jks -deststorepass "$storepass"

            chown jetty:jetty ssl-keystore.jks
            chmod 440 ssl-keystore.jks
	    mv "$keystore" "$(date +%Y%m%d)-$keystore"
            mv ssl-keystore.jks "$keystore"

            service jetty restart
