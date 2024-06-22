 # Facila Konekto

  Fonctions de connexion automatique ssh ou telnet
   ```
   version : 1.00 - Janvier 2024
   auteur  : Thierry Le Gall
   contact : facila@gmx.fr
   site    : https://github.com/facila/konekto

  1 : konekto.pl       : fonction de connexion automatique en ssh ou telnet
  2 : konekto.sh       : ouverture d'une connexion à partir d'une adresse
  3 : konekto_xterm.sh : ouverture d'une connexion dans une fenêtre xterm
  4 : konekto_debug.sh : utilisation de la connexion d'un autre utilisateur
```
 ### 1 : konekto.pl ADDRESS -u USERNAME -p PASSWORD -l LOGIN -pr PROMPT_READ -pw PROMPT_WRITE -f FUNCTION -h

      script perl avec utilisation du module Expect.pm

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

      OPTIONS : synthaxe identique à celle de konekto.pl
      USERNAME et PASSWORD sont recherchés dans $VAR/user

      exécution de konekto.pl COMMAND

      pour une définition de USERNAME , PASSWORD , LOGIN , PROMPT_READ , PROMPT_WRITE et FUNCTION correspondants à d'autres critères 
      - copier konekto.sh en "myscript.sh"
      - adapter la recherche de USERNAME et PASSWORD à votre environnement
      - adapter la recherche de LOGIN , PROMPT_READ , PROMPT_WRITE si besoin
      - ajouter des FUNCTION et leurs fichiers associés si besoin
      - modifier les paramètres de l'appel à konekto.pl en conséquence

### 3 : konekto_xterm.sh NAME "COMMAND" ["XTERM"]

      XTERM : couleurs , police et taille de la fenêtre

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
