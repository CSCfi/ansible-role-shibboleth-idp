[![Build Status](https://travis-ci.org/CSCfi/ansible-role-shibboleth-idp.svg?branch=master)](https://travis-ci.org/CSCfi/ansible-role-shibboleth-idp)

Ansible-Role: Shibboleth IdP
=========

An role which installs Shibboleth IdP on RedHat/Debian servers

Requirements
------------

* cmprescott.xml ( Mandatory )
* CSCfi.jetty ( Optional, /opt/jetty must anyways contain unpacked jetty distribution )

Role Variables
--------------

See defaults/main.yml for the variables you can overwrite via role call via parameter

Dependencies
------------

* cmprescott.xml ( Mandatory )
* CSCfi.jetty

Example Playbook
----------------

    - hosts: all
      roles:
        - { role: cmprescott.xml }
        - { role: CSCfi.jetty }
        - { role: CSCfi.shibboleth-idp }

