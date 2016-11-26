#!/bin/bash

#Création dossier du nouveau site.

mkdir -p /var/www/$1

#Création du fichier de test en .html dans le nouveau dossier.

cat << EndOfHtml > /var/www/$1/index.html

<h1>Test de site par script.</h1>

EndOfHtml

echo "$1	IN	CNAME	WSSYSCP1" >> /etc/bind/db.workshop.fr

cat /etc/bind/db.workshop.fr

#Création du fichier .conf pour le nouveau site.

cat << EndOfFile > /etc/apache2/sites-available/$1.fr.conf

<VirtualHost $1.fr>

	ServerName $1.fr

	ServerAdmin webmaster@localhost
	ServerPath "/var/www/$1/"
	DocumentRoot "/var/www/$1/"

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

EndOfFile

reloadBind="service bind9 reload"
a2ensite="a2ensite $1.fr.conf"
reloadApache="service apache2 reload"

#Utilisation de la commande a2ensite pour créer le lien entre sites-availables et sites-enabled

eval $reloadBind

eval $a2ensite

eval $reloadApache


