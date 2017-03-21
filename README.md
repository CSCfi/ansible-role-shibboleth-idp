[![Build Status](https://travis-ci.org/CSC-IT-Center-for-Science/ansible-role-shibboleth-idp.svg?branch=master)](https://travis-ci.org/CSC-IT-Center-for-Science/ansible-role-shibboleth-idp)

Ansible-Role: Shibboleth IdP
=========

An role which installs Shibboleth IdP on RedHat/Debian servers

Requirements
------------

* cmprescott.xml ( Mandatory )
* CSC-IT-Center-for-Science.jetty ( Optional, /opt/jetty must anyways contain unpacked jetty distribution )

Role Variables
--------------

See defaults/main.yml for the variables you can overwrite via role call via parameter

Dependencies
------------

* cmprescott.xml ( Mandatory )
* CSC-IT-Center-for-Science.jetty

Example Playbook
----------------

    - hosts: localhost
      roles:
        - { role: cmprescott.xml }
        - { role: CSC-IT-Center-for-Science.jetty }
        - { role: CSC-IT-Center-for-Science.shibboleth-idp }

