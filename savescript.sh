#Création des archives des sauvegardes dans le dossier var.

save1="tar -cvzf /var/$1.tar.gz /etc/bind/"
save2="tar -cvzf /var/$2.tar.gz /etc/apache2"

eval $save1
eval $save2
