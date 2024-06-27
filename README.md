# Facila Konekto
### Fonctions de copie et de connexion automatique en scp , ssh ou telnet
    version : 1.00 - Janvier 2024
    auteur  : Thierry Le Gall
    contact : facila@gmx.fr
    site    : https://github.com/facila/konekto

    1 : kopio.pl         : fonction de copy automatique en scp
    2 : konekto.pl       : fonction de connexion automatique en ssh ou telnet
    3 : konekto.sh       : ouverture d'une connexion à partir d'une adresse
    4 : konekto_xterm.sh : ouverture d'une connexion dans une fenêtre xterm
    5 : konekto_debug.sh : utilisation de la connexion d'un autre utilisateur

### Installation de facila konekto
    vous devez avoir installé au préalable :
    - perl 
    - Expect.pm

    téléchargez kreo à partir de github :
    - cliquez sur : Code
    - cliquez sur : Download ZIP

    l'installation se fait dans le répertoire de l'utilisateur
    tapez les commandes suivantes :
      MAIN=konekto-main
      TAR=konekto.v1.00.tar.gz
      DIR="nom du répertoire où se trouve le fichier téléchargé : $MAIN.zip"
      cd
      mv $DIR/$MAIN.zip .
      unzip $MAIN.zip
      sh $MAIN/install.sh $TAR

    si la variable globale $FACILA n'existe pas
    - elle est créée dans ~/.bashrc : "export FACILA=~/facila"
  
### 1 : kopio.pl COPY SOURCE TARGET PASSWORD
    exemple : kopio.pl scp admin@192.168.1.254:startup-config "dir/file" "password"
    exemple : kopio.pl scp "dir/file" admin@192.168.1.254:running-config "password"

    script perl avec utilisation du module Expect.pm
    COPY est défini dans $var/command

### 2 : konekto.pl LOGIN ADDRESS USERNAME PASSWORD [FUNCTION]
     exemple : konekto.pl ssh 192.168.1.254 admin "password"

     script perl avec utilisation du module Expect.pm
     la commande de connexion correspondant à LOGIN et le PROMPT sont définis dans $var/command
     vous pouvez créer des commandes avec de nouveaux modes ou de nouvelles options 
     vous pouvez créer des functions avec les commandes de Expect correspondant à votre environnement

### 3 : konekto.sh ADDRESS 
    USERNAME et PASSWORD sont recherchés dans $VAR/user
    exécution de konekto.pl ssh ADDRESS USERNAME PASSWORD

    pour une définition de LOGIN , USERNAME , PASSWORD et FUNCTION correspondants à d'autres critères 
    - copier konekto.sh en "myscript.sh"
    - adapter la recherche de LOGIN , USERNAME et PASSWORD à votre environnement
    - ajouter des FUNCTION et leurs fichiers associés si besoin

### 4 : konekto_xterm.sh NAME "KONEKTO" ["XTERM"]
    NAME    : nom de l'équipement
    KONEKTO : paramètres de konekto.pl : LOGIN ADDRESS USERNAME PASSWORD FUNCTION
    XTERM   : couleurs , police et taille de la fenêtre

    exécution de la connexion konekto.pl KONEKTO dans une fenêtre xterm
    - avec 2 fichiers temporaires $OUT et $IN
    - $OUT permet à partir d'autres scripts de suivre le résultat des commandes d'une FUNCTION et d'agir en conséquence
    - $OUT permet de sauvegarder la connexion
    - $IN  permet à d'autres utilisateurs d'utiliser la même connexion

### 5 : konekto_debug.sh ["XTERM"]
    XTERM : couleurs , police et taille de la fenêtre

    exécution dans une fenêtre xterm de la connexion d'un autre utilisateur avec la possibilité de l'utiliser ensemble
    affichage de la liste des connexion en cours 
    sélection d'une connexion
    ouverture du terminal
