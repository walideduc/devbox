# DevBox Kubernetes & Helm

## Description

Cette devbox est basée sur centos 7 et intègre les packages de base (zip / vi / tar / zsh ...).

Les roles ansibles permettent d'automatiser tous ces processus. A noter qu'il est possible de porter ces playbooks ansible afin de provisionner des toutes sortes de VMs.

Un dossier partagé est automatiquement provisionné entre Windows, sur `$(pwd)` et dans la VM sur `/vagrant`

## Prérequis

1. Installer `Vagrant` : https://www.vagrantup.com/downloads.html
2. Installer `VisrtualBox` : https://www.virtualbox.org/wiki/Downloads
3. Cette VM nécessite `4Go RAM` et `4 cpus` pour fonctionner

`Vagrant` est un outil permettant d'abstraire les APIs des différents providers de virtualisation (HyperV / VMWare / KVM / VirtualBox) afin de spawn des VMs et de les provisionner.

## Lancement

Pour lancer la VM et provisionner l'ensemble de l'écosystème de façon automatique il faut cloner ce repo, et à la racine, lancer la ligne de commande suivante :

```bash
vagrant up
```

Une fois le déploiement terminé, lancer le navigateur sur `https://dashboard.vcap.me` et sélectionner `Skip` : Vous avez accès au dashboard Kubernetes.

NB : En fonction du système et de la connexion internet, le provisioning de la VM s'effectue en 1H environ

## Extinction

Pour éteindre la VM il faut lancer la ligne de commande suivante :

```bash
vagrant halt
```

## Customisation

La customisation de la VM est possible. Par exemple modifier les proxys utilisés depuis le fichier `provisioning/group_vars/all.yml`

Le reste de la customisation peut être effectué dans le fichier `Vagrantfile`. 