# Interprétation des informations sur les comptes et les groupes

Exécutez la commande id pour afficher des informations sur votre compte et les groupes dont vous êtes membres :
```sh
bigzb@lb-laptop:~$ id
uid=1000(bigzb) gid=1000(bigzb) groups=1000(bigzb),4(adm),6(disk),20(dialout),27(sudo),107(input),109(kvm),123(lpadmin),134(vboxusers),137(libvirt),999(docker),64055(libvirt-qemu)
```

Quel est votre UID et quel est votre nom de compte?

- Ici on voit que mon UID est 1000 et mon nom d'utilisateur est `bigzb`

Quel est le GID de votre groupe principal ("groupe principal") et quel est son nom?

- Ici on voit que le GID de mon groupe principale est 1000 et le nom du groupe est `bigzb`

De combien d’autres groupes êtes-vous membre ?

- On peut voir que le champs groups contient 12 groupes au total j'appartient donc à 11 autres groupes que le principale.

# Interprétation des métadonnées de contrôle d'accès sur les fichiers et répertoires

1) Pour les fichiers suivants, déterminez qui est le propriétaire et quel groupe possède le fichier 
et caractériser le groupe de personnes qui savent lire, qui savent écrire et qui peuvent
exécuter le fichier.

| File            | Owner | Read  | Write | Exec. |
|---------------- | ----- | ----- | ----- | ----- |
| /etc/passwd     | root  | All   | Owner | None  |
| /bin/ls         | root  | All   | Owner | All   |
| ~/.bashrc       | bigzb | All   | Owner | None  |
| ~/.bash_history | bigzb | Owner | Owner | None  |

Pour trouver ces informations, j'utilise la commande suivante:

```sh
ls -la <path/to/file>
```

2) Examinez les autorisations de votre répertoire home.

Quelles options devez-vous passer à ls pour examiner les permissions des répertoires ?

```sh
ls -ld ~
drwxr-x--- 75 bigzb bigzb 4096 Apr 29 13:13 /home/bigzb
```

Qui est le propriétaire et quel est le groupe propriétaire?

- Ici c'est bigzb le propriétaire et aussi le groupe principale du propriétaire (moi).

Quelle est la configuration des autorisations?

- Qui peut lister les fichiers ?
 - Le propriétaire et les membre du groupe seulement.

- Qui peut créer des fichiers ?
 - Seul le propriétaire en est capable.

3. Quelles autorisations vous permettent de créer des fichiers dans le répertoire /tmp ?

```sh
ls -ld /tmp
drwxrwxrwt 31 root root 12288 Apr 29 17:04 /tmp
```

Dans le dernier champs des permissions, on peut voir un `t` à la place du `x`.
Cela veut dire que les fichier créer dans ce répertoire ne peuvent être renommé ou supprimé que par un
utilisateur qui a la permission w sur le répertoire et qui est le propriétaire du fichier.

On appel ça le sticky bit.

# Modification des droits d'accès

1. Créez un fichier et initialisez ses autorisations sur rw- --- --- avec les commandes suivantes:

```sh
touch file
chmod 600 file

# rw- r-- ---
chmod g+r file

#rwx r-x ---
chmod g+rx file

#r-- r-- r--
chmod a=r file

#rwx r-- r--
chmod a+r,u+x file

#rwx --- ---
chmod u+x file
```

