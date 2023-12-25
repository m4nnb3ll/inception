include srcs/.env

DOCKER_COMPOSE	:= docker compose -f srcs/docker-compose.yml

.PHONY: all
all: $(WP_VOL_PATH) $(MDB_VOL_PATH)
	make up

.PHONY: up
up: $(WP_VOL_PATH) $(MDB_VOL_PATH)
	$(DOCKER_COMPOSE) up -d --build

.PHONY: down
down:
	$(DOCKER_COMPOSE) down

.PHONY: clean
clean:
	$(DOCKER_COMPOSE) down --volumes --rmi all

.PHONY: fclean
fclean: clean
	rm -rf $(WP_VOL_PATH) $(MDB_VOL_PATH)

.PHONY: re
re: fclean
	$(MAKE) all

$(WP_VOL_PATH):
	mkdir -p $(WP_VOL_PATH)

$(MDB_VOL_PATH):
	mkdir -p $(MDB_VOL_PATH)
