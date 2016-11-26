#Création des archives des sauvegardes dans le dossier var.

save1="tar -cvzf /var/archive.tar.gz /etc/bind/named.conf.local"
save2="tar -cvzf /var/archive2.tar.gz /etc/bind/db.workshop.fr"

eval $save1
eval $save2
