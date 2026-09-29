# Facila Konekto
### Fonctions de copie , de connexion automatique , de sauvegarde et de téléchargement
### en scp , ssh ou telnet
    version : 2.00 Septembre 2026
    auteur  : Thierry Le Gall
    contact : facila@gmx.fr
    site    : https://github.com/facila/konekto

    1 : kopio.pl         : fonction de copy automatique en scp
    2 : konekto.pl       : fonction de connexion automatique en ssh ou telnet
    3 : konekto.sh       : ouverture d'une connexion à partir d'une adresse
    4 : konekto_xterm.sh : ouverture d'une connexion dans une fenêtre xterm
    5 : konekto_debug.sh : utilisation de la connexion d'un autre utilisateur
    6 : sendo.sh         : fonction de sauvegarde et de téléchargement d'équipements réseau fonctionnant en mode running et startup

### Installation de facila konekto
    vous devez avoir installé au préalable :
    - perl 
      apt-get install perl
    - Expect.pm
      apt-get install perl-modules
      cpan Expect.pm

    voir facila/install README.md

 1 : kopio.pl FUNCTION SOURCE TARGET PASSWORD

     exemple : kopio.pl scp admin@192.168.1.254:startup-config "dir/file" "password"
     exemple : kopio.pl scp "dir/file" admin@192.168.1.254:running-config "password"

     script perl avec utilisation du module Expect.pm
     COPY est défini dans data/config

 2 : konekto.pl FUNCTION ADDRESS USERNAME PASSWORD [COMMAND]

     exemple : konekto.pl ssh 192.168.1.254 admin "password"

     script perl avec utilisation du module Expect.pm
     le PROMPT , la COMMAND et le MODE de connexion correspondant à FUNCTION sont définis dans data/config
     vous pouvez créer des fonctions de login avec de nouveaux modes ou de nouvelles options

     COMMAND est optionel et à plusieurs formats pour envoyer des commandes
     vous pouvez créer des commandes correspondant à votre environnement
     - un fichier de commandes dans data
     - des commandes numérotées xxxx dans data/command
     - une liste de commandes séparées par des ;

 3 : konekto.sh ADDRESS USERNAME

     FUNCTION : ssh
     PASSWORD : est recherché dans data/user
     COMMAND  : est vide
     exécution de konekto.pl : FUNCTION ADDRESS USERNAME PASSWORD COMMAND

     pour une définition de FUNCTION , USERNAME , PASSWORD et COMMAND correspondants à d'autres critères 
     - copier konekto.sh en "myscript.sh"
     - adapter la recherche de FUNCTION , USERNAME et PASSWORD à votre environnement
     - ajouter des COMMAND et leurs fichiers associés si besoin

 4 : konekto_xterm.sh NAME "KONEKTO" ["XTERM"]

     NAME    : nom de l'équipement
     KONEKTO : paramètres de konekto.pl : FUNCTION ADDRESS USERNAME PASSWORD COMMAND
     XTERM   : couleurs , police et taille de la fenêtre

     exécution de la connexion konekto.pl KONEKTO dans une fenêtre xterm
     - avec 2 fichiers temporaires $OUT et $IN
     - $OUT permet à partir d'autres scripts de suivre le résultat des commandes et d'agir en conséquence
     - $OUT permet de sauvegarder la connexion
     - $IN  permet à d'autres utilisateurs d'utiliser la même connexion

 5 : konekto_debug.sh ["XTERM"]

     XTERM : couleurs , police et taille de la fenêtre

     exécution dans une fenêtre xterm de la connexion d'un autre utilisateur avec la possibilité de l'utiliser ensemble
     affichage de la liste des connexion en cours 
     sélection d'une connexion
     ouverture du terminal

 6 : sendo.sh FUNCTION NAME ["KOPIO1"] ["KONEKTO"] ["KOPIO2"] ["XTERM"]

     $1 = SAVE  : sauvegarde de la configuration dans l'équipement + puis sur le serveur :          "KONEKTO" "KOPIO2" 
     $1 = RUN   : téléchargement d'une configuration en running + sauvegarde ( save )    : "KOPIO1" "KONEKTO" "KOPIO2"
     $1 = START : téléchargement d'une configuration en startup + reboot ?               : "KOPIO1" "KONEKTO"

     exécution de sendo.sh , dans une fenêtre xterm si XTERM
     $1 = FUNCTION : save , run ou start en minuscules avec XTERM
     $1 = FUNCTION : SAVE , RUN ou START en majuscules sans XTERM
     $2 = NAME     : nom de l'équipement pour le titre de xterm
     $2 = KOPIO1   : paramètre de kopio.pl   :
     $3 = KONEKTO  : paramètre de konekto.pl :
     $4 = KOPIO2   : paramètre de kopio.pl   :
     $6 = XTERM    : couleurs , police et taille de la fenêtre
