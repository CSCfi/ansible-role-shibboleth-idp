FROM cscfi/shibboleth-idp

MAINTAINER sami.silen@csc.fi

ADD customized-shibboleth-idp/ /opt/shibboleth-idp/

RUN chown -R root:jetty /opt \
    && chmod -R 550 /opt
