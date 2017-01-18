git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
docker_machine_ip = $$(docker-machine ip default)
reliable_master_IP = 192.168.155.1
reliable_master_port = 3333

all: test
start:
	RELIABLE_MASTER=$(reliable_master_IP):$(reliable_master_port) docker-compose down
	RELIABLE_MASTER=$(reliable_master_IP):$(reliable_master_port) docker-compose build
	RELIABLE_MASTER=$(reliable_master_IP):$(reliable_master_port) docker-compose up -d --remove-orphans
