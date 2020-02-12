CONFIGURATION DE BASE D’UN ROUTEUR
==================================

Configuration de base du routeur
--------------------------------

Passage en mode d’exécution privilégié :
```
Router>enable
```

Passez en mode de configuration globale :
```
Router#config t
Router#configure terminal
```

Changement nom d’hôte unique du routeur :
```
Router(config)#hostname R1
```

Changement mdp passage en mode d’exécution privilégié :
```
Router(config)#enable secret <mot de passe>
```

Configuration les lignes de console et telnet pour se connecter au routeur :
```
R1(config)#line console 0
R1(config-line)#password cisco
R1(config-line)#login
R1(config-line)#exit
R1(config)#line vty 0 4
R1(config-line)#password cisco
R1(config-line)#login
R1(config-line)#exit
```

Configuration d’une bannière de connexion :

```
R1(config)#banner motd #
Enter TEXT message. End with the character ‘#’.
******************************************
WARNING!! Unauthorized Access Prohibited!!
******************************************
#
```


Configuration des interfaces du routeur
---------------------------------------

```
R1#config t
R1(config)#interface Serial0/0
R1(config-if)#ip address 192.168.2.1 255.255.255.0
R1(config-if)#description Ciruit#VBN32696-123 (help desk:1-800-555-1234)
```

Enregistrer les modifications apportées à un routeur
----------------------------------------------------
```
R1#copy running-config startup-config : Enregistrer les modifications .
```

Vérifier des informations renvoyées par les commandes show
----------------------------------------------------------
Voir configuration en cours, stockée dans la mémoire vive :
```
R1#show running-config
```
Voir table de routage actuelle (chemins vers autres réseaux) :
```
R1#show ip route
```
Voir informations sommaires sur la configuration d’interface :
```
R1#show ip interface brief
```
```
R1#show interfaces
```

Configurer une interface Ethernet
---------------------------------

```
R1(config)#interface fastethernet 0/0
R1(config-if)#ip address 172.16.3.1 255.255.255.0
R1(config-if)#no shutdown
```

Configurer une interface Série
------------------------------

```
R1(config)#interface serial 0/0/0
R1(config-if)#clock rate 64000
R1(config-if)#ip address 172.16.2.1 255.255.255.0
R1(config-if)#no shutdown
R1#show interfaces serial 0/0/0
```


Vérifier les informations de routage
------------------------------------
```
R1#show ip route
R1#show ip interface brief
```

Surveiller et dépanner son réseau avec CDP
------------------------------------------
```
R1#show cdp neighbors
R1#show cdp neighbors detail
```

Commandes basiques
==================
(https://www.linuxtricks.fr/wiki/commandes-basiques-cisco)

Outils diagnostic
-----------------
```
Router# ping <ip>
Router# traceroute <ip>
```

Visualisation de l'état de l'équipement
---------------------------------------
```
Router# show version
Router# show flash
Router# show memory
Router# show interfaces
```

Visualisation et sauvegarde de la configuration
------------------------------------------------
```
Router# show running-config
Router# show startup-config
```
```
Router# copy running-config startup-config
Router# write memory

```
```
Router# copy running-config tftp:<..>
```

```
Router# erase startup-config
```

Config de base équipement Cisco
-------------------------------

```
Router(config)# hostname router-name
```


Définir un mot de passe pour l'exécution en mode privilégié (non crypté) :
```
Router(config)# enable password password
```

Définir un mot de passe pour l'exécution en mode privilégié (crypté) :
```
Router(config)# enable secret password
```

Définir une bannière de connexion :
```
Router(config)# banner motd # message #
```



Configuration des lignes consoles et terminaux virtuels (vty)
-------------------------------------------------------------

Pour la console (port console) :
```
Router(config)# line console 0
Router(config-line)# password password
Router(config-line)# login
Router(config-line)# logging synchronous
```

Pour les ligne vty (telnet) :
```
Router(config)# line vty 0 4
Switch(config)# line vty 0 15
Router(config-line)# password password
Router(config-line)# login
```

Crypter les messages précédemment saisis :
```
Router(config)# service password-encryption
```





Sources
=======
https://www.fbotutos.com/commandes-routeurs-cisco.html
https://www.linuxtricks.fr/wiki/commandes-basiques-cisco
https://upaae.com/cisco-router-modes-user-exe-mode-enable-mode-globel-configuration-mode/
https://itstepforward.files.wordpress.com/2013/01/image001-708497.gif



