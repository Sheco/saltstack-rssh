# Reverse SSH mechanism to connect to a SaltStack minion

This is a tool to create a reverse SSH tunnel from a salt minion, and then connect to that tunnel, gaining shell access on the minion.

## Installation

The tool needs a user "rssh" in the salt-master, this is going to be a limited user that's only going to receive the rssh connections, without any other particular privileges.

This user is created automatically by the [auth](auth) script if rssh's authorized\_keys file does not exist.

The minions are going to need to be able to connect to this salt-master, the public hostname and ssh port are defined in the [connect](connect) script.

## Setting up the minions

Before being able to connect to a minion, you need to set up the authentication keys.

This means that both rssh@saltmaster and root@minion need to have each other's ppublic ssh keys, because the minion will connect to rssh@saltmaster and saltmaster will connect to root@minion.

There's an [auth](auth) script in this directory that achieves that goal, alongside a [salt/ssh_auth.sls](salt/ssh_auth.sls) file that can be installed in ```/srv/salt/```.

If a different destination directory is picked to install this ssh_auth.sls file, please remember to update the auth script so it finds the file.

## Connecting

Once all that is done, you can just connect to a minion using the [connect](connect) script in this directory.

It only expects a single argument, the name of the minion.

It will use salt to tell the minion to connect to the master and create the tunnel on a random port, after that it will try to connect to that port.

