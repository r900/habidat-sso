#!/bin/sh

cd /

# Create a parameters file if it does not exist.
if [ ! -f params.yml ] ; then
	cat /params.default.yml >> /params.yml
fi

# only generate cert if the GEN_CERT env var is set (doesn't matter with what though)
#if [ -z "$GEN_CERT" ]; then
#  cd /app/public/simplesaml/cert && openssl req -new -x509 -days 3652 -nodes -out server.cert -keyout server.pem -subj "/C=AT/ST=Upper Austria/L=Linz/O=habiDAT/OU=SSO/CN=$SSO_DOMAIN"
#fi

gomplate -f app/templates/config.php.tpl -o var/simplesaml/config/config.php -d params=params.yml

gomplate -f app/templates/authsources.php.tpl -o var/simplesaml/config/authsources.php -d params=params.yml

gomplate -f app/templates/saml20-idp-hosted.php.tpl  -o var/simplesaml/metadata/saml20-idp-hosted.php -d params=params.yml

gomplate -f app/templates/saml20-sp-remote.php.tpl -o var/simplesaml/metadata/saml20-sp-remote.php -d params=params.yml

envsubst < sso.conf > /etc/apache2/sites-available/sso.conf

a2ensite sso.conf

"$@"
