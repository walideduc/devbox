# DevBox

## Description

Cette devbox est basée sur centos 7 et intègre les packages de base (zip / vi / tar / zsh ...).

Les roles ansibles permettent d'automatiser tous ces processus. A noter qu'il est possible de porter ces playbooks ansible afin de provisionner des toutes sortes de VMs.

Un dossier partagé est automatiquement provisionné entre Windows, sur `$(pwd)` et dans la VM sur `/vagrant`.

## Prérequis

1. Installer `Vagrant` : https://www.vagrantup.com/downloads.html
2. Installer `VirtualBox` : https://www.virtualbox.org/wiki/Downloads
3. Cette VM nécessite `4Go RAM` et `4 cpus` pour fonctionner
4. Configurer le proxy :
```cmd
set HTTPS_PROXY=http://proxy.priv.atos.fr:3128
set HTTP_PROXY=http://proxy.priv.atos.fr:3128
set VAGRANT_HTTPS_PROXY=http://proxy.priv.atos.fr:3128
set VAGRANT_HTTP_PROXY=http://proxy.priv.atos.fr:3128
```

`Vagrant` est un outil permettant d'abstraire les APIs des différents providers de virtualisation (HyperV / VMWare / KVM / VirtualBox) afin de spawn des VMs et de les provisionner.

## Lancement

Pour lancer la VM et provisionner l'ensemble de l'écosystème de façon automatique il faut cloner ce repo, et à la racine, lancer la ligne de commande suivante :
```bash
vagrant up
```

Accès à la box :
```bash
vagrant ssh
```
ou encore, il est possible d'ajouter la clé SSH privée présente dans `.vagrant\machines\devbox\virtualbox\private_key` dans Putty et d'y accéder à l'aide d'un vrai terminal.

NB : En fonction du système et de la connexion internet, le provisioning de la VM s'effectue en 1H environ.

## Extinction

Pour éteindre la VM il faut lancer la ligne de commande suivante :

```bash
vagrant halt
```

## Customisation

La customisation de la VM est possible. Elle s'effectue depuis le fichier `provisioning/group_vars/all.yml` :

La configuration Git de `user.name` et `user.email` :
```yaml
git_config_global:
  - { name: "user.name",  value: "name" }
  - { name: "user.email", value: "email" }
```

La configuration des credentials d'accès à AWS :
```yaml
aws:
  dev:
    region: dev_region
    role_arn: dev_role_arn
  oat:
    region: oat_region
    role_arn: oat_role_arn
  pro:
    region: pro_region
    role_arn: pro_role_arn
  access_key: aws_access_key
  secret_access_key: aws_secret_access_key
```

La version aws-iam-authenticator (à mettre à jour si besoin) :
```yaml
aws_iam_authenticator_version: 1.12.7/2019-03-27
```

Le reste de la customisation peut être effectué dans le fichier `Vagrantfile`.

## Commandes

Mise à jour kubeconfig pour DEV :
```bash
aws eks update-kubeconfig --name softwarefactory-dev --role-arn arn:aws:iam::176806391229:role/rol-softfactory-dev-base-wl --profile dev
```

Mise à jour kubeconfig pour OAT :
```bash
aws eks update-kubeconfig --name softwarefactory-oat --role-arn arn:aws:iam::094242746997:role/rol-softfactory-oat-base-wl --profile oat
```

Mise à jour kubeconfig pour PRO :
```bash
aws eks update-kubeconfig --name softwarefactory-pro --role-arn arn:aws:iam::717170762493:role/rol-softfactory-pro-base-wl --profile pro
```

Initialisation helm client only :
```bash
helm init --client-only
```
