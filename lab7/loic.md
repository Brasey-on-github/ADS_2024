
## Task 3

a. Which line in /etc/sudoers gives the members of the group sudo the right to execute any command?

```t
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
```

b. How would you have to modify this line so that users can use sudo without typing a password (this is in general not recommended, but can be handy sometimes).

```t
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL, NOPASSWD:ALL
```

c. Perform the following steps and give in the lab report the commands you used.
1. Give the account luke sudo rights.
```zsh
bitcraze@ubuntu:~$ sudo adduser luke sudo
```
2. Test the new rights. Verify that luke can read the file /etc/shadow using
sudo.
```zsh
luke@ubuntu:/home/bitcraze$ sudo cat /etc/shadow
root:!:19076:0:99999:7:::
daemon:*:19076:0:99999:7:::
bin:*:19076:0:99999:7:::
...
```
3. Remove sudo rights from the account luke .
```sh
bitcraze@ubuntu:~$ sudo deluser luke sudo
```
Ici, on passe par le groupe sudo pour lui donner les droits mais il y a d'autre moyen comme ajouter une ligne dans `/etc/sudoers` 

# Task 4

Perform the following steps and give in the lab report the commands you used. Use the
tool userdel .
1. Remove the account leia , but do not delete the home directory yet.  
```sh
sudo userdel leia
```
2. Inspect the home directory (look at the file metadata). What has changed?  
 - Tout les fichiers restent liées aux ancien UID et au GID de leia.  
```sh
sudo ls -la /home/leia
```
3. Suppose the user leia has created other files on the system, but you do not know where they are. How would you systematically scan the whole system to find them?
```sh
sudo find / -uid <leia old uid>
```
4. Remove the home directory manually.

```sh
sudo rm -rf /home/leia
```