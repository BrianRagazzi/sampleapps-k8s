Watch startup:
kubectl attach mctest-78b94dff85-9826l -c mctest -i -n minecraft


once running, add users as ops:
kubectl exec mctest-78b94dff85-sjkfb -n minecraft -- rcon-cli op nerobrian


get a shell on container:
kubectl exec mctest-78b94dff85-sjkfb -n minecraft -it /bin/bash

Stop Minecraft Server, leave container running
kubectl exec mctest-78b94dff85-sjkfb -n minecraft -- /rcon-cli stop


install scp:
apk update && apk add openssh sshpass

scp -r ubuntu@minecraft.ragazzilab.com:/home/ubuntu/servers/survive/world/ /data/world/

chown -R minecraft:minecraft /data/world
chown -R minecraft:minecraft /data/world_nether
chown -R minecraft:minecraft /data/world_the_end 

restart server:
kubectl exec mctest-78b94dff85-sjkfb -n minecraft -- /start
