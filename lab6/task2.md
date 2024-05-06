## TASK 2

Commande find pour lister tous les fichiers et repos world writable:

```bash
find . -perm -o+w
```

Execution du script [fix_permissions.sh](./fix_permissions.sh):

```bash
./fix_permissions.sh
```

L'execution me trouve bien les fichiers et directory world writable dans l'arborescence test_dir que j'ai pris soin de modifié pour avoir certains fichier/dir en world writable.

Arborescence [test_dir.txt](./test_dir.txt)

## TASK3

Execution du script [fix_permissions.sh](./fix_permissions.sh):

```bash
./fix_permissions.sh <directory_name>
```

Arborescence [test_dir.txt](./test_dir.txt)

## TASK4

Pour la tâche 4 si la recherche de fichier world writable donne un résultat non vide alors on demande à l'utilisateur s'il souhaite enlever la permission world writable. Tant qu'il ne répond pas "y" ou "n" on lui demande. S'il le souhaite on fixe les permission sinon on ne fait rien.

Execution du script [fix_permissions.sh](./fix_permissions.sh):

```bash
./fix_permissions.sh <directory_name>
```

Arborescence [test_dir.txt](./test_dir.txt)

Les fichiers ne réapparaisse plus lors de la 2e execution de script => fonctionne.

## TASK5 

Ici j'ai juste recopié le script d'avant sous le nom [fix_group_permissions.sh](./fix_group_permissions.sh). Puis changer ce dernier pour qu'il affiche les worlds writable et les group writable (sauf ceux du groupe personel) sous deux liste séparé puis le demande de fix se fait pour tous les fichiers.

J'ai aussi changer l'arborescence en conséquence [test_dir_task5.txt](./test_dir_task5.txt)

Les fichiers ne réapparaisse plus lors de la 2e execution de script => fonctionne.

