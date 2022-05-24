build:
	@docker build -t centosclient .
run:
	@docker run \
          -d \
          --privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /lib/modules:/lib/modules:ro \
          --net asr2privatenet \
          --ip 192.168.2.29 \
--name router1client centosclient
addnetworks:
	@docker network create -d macvlan --subnet=192.168.1.0/24 -o parent=ens160 asr1privatenet
	@docker network create -d macvlan --subnet=192.168.2.0/24 -o parent=ens224 asr2privatenet
	@docker network create -d macvlan --subnet=192.168.3.0/24 -o parent=ens192 asr3privatenet
delnetworks:
	@docker network remove asr1privatenet
	@docker network remove asr2privatenet
	@docker network remove asr3privatenet
