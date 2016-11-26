#!/bin/bash

#Création dossier du nouveau site.

mkdir -p /var/www/$1

#Création du fichier de test en .html dans le nouveau dossier.

cat << EndOfHtml > /var/www/$1/index.html

<h1>Test de site par script.</h1>

EndOfHtml

#Création du fichier .conf pour le nouveau site.

cat << EndOfFile > /etc/apache2/site-available/$1.$2.fr.conf

<VitrtualHost $1.$2.fr>

	ServerName $1.$2.fr

	ServerAdmin webmaster@localhost
	ServerPath "/var/www/$1/"
	DocumentRoot "/var/www/$1/"

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

EndOfFile

a2ensite="a2ensite $1.$2.fr.conf"

eval $a2ensite

echo service apache2 reload


