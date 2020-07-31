build:
	@docker build -t centosclient .
run:
	@docker run \
          -d \
          --privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /lib/modules:/lib/modules:ro \
          --net asr1privatenet \
          --ip 1.168.1.2 \
          --net asr2privatenet \
          --ip 1.168.2.2 \
--name router1client centosclient
addnetworks:
	@docker network create -d macvlan --subnet=1.168.1.0/24 -o parent=ens192 asr1privatenet
	@docker network create -d macvlan --subnet=1.168.2.0/24 -o parent=ens224 asr2privatenet
	@docker network create -d macvlan --subnet=1.168.3.0/24 -o parent=ens256 asr3privatenet
delnetworks:
	@docker network remove asr1privatenet
	@docker network remove asr2privatenet
	@docker network remove asr3privatenet
