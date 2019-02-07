[![Build Status](https://travis-ci.org/CSCfi/ansible-role-shibboleth-idp.svg?branch=master)](https://travis-ci.org/CSCfi/ansible-role-shibboleth-idp)

Ansible-Role: Shibboleth IdP
=========

An role which installs Shibboleth IdP on RedHat/Debian servers

Requirements
------------

* cmprescott.xml ( Optional, asfaik now bundled in ansible core )
* CSCfi.jetty ( Optional, /opt/jetty must anyways contain unpacked jetty distribution )
* CSCfi.mariadb (Optional, configurable nameid uses database storage )

Role Variables
--------------

See defaults/main.yml for the variables you can overwrite via role call via parameter
You can also pass configurables array for role. This array contains extra configurable items for shibboleth IdP such as

For federations ( Configures metadata source and certificates for IdP)
* haka-test
* edugain
* haka
* virtu-test

For extra functionality
* consent ( Configure default consent module parameters, currently contains static predefined values )
* loganalysis ( Install loganalysis.py script and configure it to cron, with monthly report in Jetty webroot )
* slo ( Single logout configuration with predefined static values )
* mfa-client
* mfa-server
* mfa-stepup-server
* nameid ( Configure nameid, Currently utilizes uid. Some parameters (eg: uid, can be overwritten by passing parameters. See defaults/main.yml [ Requires Mariadb ] )
* fticks ( Configure F-ticks, untested... work in progress )
* ldap.yml ( Configure LDAP backend for shibboleth IdP, TLS only with overwritable parameters from defaults/main.yml )
* oidc ( Installs OIDC extension for shibboleth-IdP )
* certs ( will be copied under /etc/pki/tls/[certs|private] and proper configuration performed)
  * define SSL certs for shibboleth-IdP jetty installation will be created (needed: shibboleth_idp[_ssl_crt & _ssl_key & _ssl_cabundle & _keystore_password] )
  * define SAML certificates which will be configured as a encryption and signing certificate (needed: shibbolethidp[_saml_crt & _saml_key ] )
  * define SAML separate certificates for encryption and signing (needed: shibbolethidp[_saml_sig_crt & _saml_sig_key & _saml_enc_crt &_saml_enc_key ] )

See example playbook for calling role with configurable array and overwritable attributes

Dependencies
------------

* CSCfi.jetty

* Configurable: nameid debends on CSCfi.mariadb or installed database which can be accessed via root.
* Configurable: ldap requires existing ldap server.

Example Playbook
----------------

    - hosts: all
      roles:
        - { role: CSCfi.jetty }
        - role: CSCfi.shibboleth-idp
  	      configurables: ['slo','consent']
	        shibbolethidp_jetty_secure_port: 8443
	        shibbolethidp_debug: true
