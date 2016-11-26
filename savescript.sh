#Création des archives des sauvegardes dans le dossier var.

save1="tar -cvzf /var/archive.tar.gz /etc/bind/"
save2="tar -cvzf /var/archive2.tar.gz /etc/apache2"

eval $save1
eval $save2
