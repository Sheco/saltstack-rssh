# copy this to the appropriate place in the salt master
# and replace the public key with the saltmaster's public key
ssh_auth:
  ssh_auth.present:
    - user: root
    - names:
       - AAAAB3Nz... root@saltmater
