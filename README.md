[![Build Status](https://travis-ci.org/CSCfi/ansible-role-shibboleth-idp.svg?branch=master)](https://travis-ci.org/CSCfi/ansible-role-shibboleth-idp)

Ansible-Role: Shibboleth IdP
=========

An role which installs Shibboleth IdP on RedHat/Debian servers

Requirements
------------

* cmprescott.xml ( Mandatory )
* CSCfi.jetty ( Optional, /opt/jetty must anyways contain unpacked jetty distribution )
* CSCfi.mariadb (Optional, configurable nameid uses database storage )

Role Variables
--------------

See defaults/main.yml for the variables you can overwrite via role call via parameter
You can also pass configurables array for role. This array contains extra configuration items: nameid, slo, consent,ldap. 
Nameid currently utilizes uid, but it can be overwritten during role call.

Dependencies
------------

* cmprescott.xml ( Mandatory )
* CSCfi.jetty

* Configurable: nameid debends on CSCfi.mariadb or installed database which can be accessed via root.

Example Playbook
----------------

    - hosts: all
      roles:
        - { role: cmprescott.xml }
        - { role: CSCfi.jetty }
        - { role: CSCfi.shibboleth-idp, configurables: ['slo','consent'] }

