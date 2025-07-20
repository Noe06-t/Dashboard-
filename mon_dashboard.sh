#!/bin/bash

# On définit le chemin du fichier log
LOG="/var/log/mon-dashboard.log"

# On crée le fichier s'il n'existe pas (avec sudo car /var/log appartient à root)
sudo touch $LOG
sudo chown $USER:$USER $LOG

# On commence à écrire dans le fichier
echo "-------- MON DASHBOARD --------" >> $LOG

# Mémoire
echo "[Mémoire]" >> $LOG
free -h >> $LOG
# Espace disque
echo "[Espace disque]" >> $LOG
df -h >> $LOG

# Utilisateur courant
echo "[Utilisateur courant]" >> $LOG
whoami >> $LOG

# Processus le plus gourmand
echo "[Processus le plus gourmand]" >> $LOG
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 2 >> $LOG

# Utilisateurs connectés
echo "[Utilisateurs connectés]" >> $LOG
who >> $LOG

# Fin
echo "-------- FIN --------" >> $LOG
