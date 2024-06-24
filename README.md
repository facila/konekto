# Facila Konekto
### Fonctions de connexion automatique en ssh ou telnet
    version : 1.00 - Janvier 2024
    auteur  : Thierry Le Gall
    contact : facila@gmx.fr
    site    : https://github.com/facila/konekto

    1 : konekto.pl       : fonction de connexion automatique en ssh ou telnet
    2 : konekto.sh       : ouverture d'une connexion à partir d'une adresse
    3 : konekto_xterm.sh : ouverture d'une connexion dans une fenêtre xterm
    4 : konekto_debug.sh : utilisation de la connexion d'un autre utilisateur

### installation de konekto
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
  
### 1 : konekto.pl ADDRESS [OPTIONS]
    script perl avec utilisation du module Expect.pm
    
    ADDRESS : adresse de la connexion
    OPTIONS :
      -u  USERNAME
      -p  PASSWORD
      -l  LOGIN        : valeur par défaut : ssh      - autre : ssh ou telnet ou telnet_user
      -pr PROMPT_READ  : valeur par défaut : >
      -pw PROMPT_WRITE : valeur par défaut : # 
      -f  FUNCTION     : valeur par défaut : interact - autre : exécution de "FUNCTION".pm
      -h               : affichage de l'aide
    
    la commande de connexion correspondant à LOGIN est définie dans $var/login
    vous pouvez en ajouter avec de nouveaux modes ou de nouvelles options 
    
    vous pouvez créer des FUNCTION avec les commandes de Expect correspondant à votre environnement

### 2 : konekto.sh ADDRESS [OPTIONS]
    ADDRESS : adresse de la connexion
    OPTIONS : synthaxe identique à celle de konekto.pl
    
    USERNAME et PASSWORD : ils sont recherchés dans $VAR/user
    COMMAND : génération de la commande pour l'exécution de : konekto.pl COMMAND

    pour une autre définition de USERNAME , PASSWORD , LOGIN , PROMPT_READ , PROMPT_WRITE et FUNCTION
    - copier konekto.sh en "myscript.sh"
    - adapter la recherche de USERNAME et PASSWORD à votre environnement
    - adapter la recherche de LOGIN , PROMPT_READ , PROMPT_WRITE si besoin
    - ajouter des FUNCTION et leurs fichiers associés si besoin
    - modifier les paramètres de l'appel à konekto.pl en conséquence

### 3 : konekto_xterm.sh NAME "COMMAND" ["XTERM"]
    NAME    : nom de l'equipement
    COMMAND : commande qui sera passée à konekto.pl
    XTERM   : couleurs , police et taille de la fenêtre

    exécution dans une fenêtre xterm de la connexion

    exécution de konekto.pl COMMAND
    - avec 2 fichiers temporaires $OUT et $IN
    - $OUT permet de suivre le résultat des commandes d'une FUNCTION et d'agir en conséquence
    - $OUT permet de sauvegarder la connexion
    - $IN  permet à d'autres utilisateurs d'utiliser la même connexion

### 4 : konekto_debug.sh ["XTERM"]
    XTERM : couleurs , police et taille de la fenêtre

    exécution dans une fenêtre xterm de la connexion d'un autre utilisateur avec la possibilité de l'utiliser ensemble

    affichage de la liste des connexion en cours 
    sélection d'une connexion
    ouverture du terminal
