# TSSR-0925-Linux


projet de script d'administration linux avec 

un premier menu nous proposant :

- outils réseaux (sous menu)

configuration réseau (ip, Gateway, mac...) ;
test de connexion réseau (ping)

- outils d'administration (sous menu)

ajouter/suppprimer un utilisateur

- installation de logiciels (sous menu)

installer et lancer htop ; 
installer serveur httpd apache2/Nginx ;
installer cockpit


#####
en étant connecter avec l'utilisateur root vous pouvez copier coller le code suivant :
```
apt install git
git clone https://github.com/edo-ops/TSSR-0925-Linux
cd TSSR-0925-Linux/
chmod +x *.sh
apt install dos2unix
dos2unix *.sh
./mainmenu.sh
```
