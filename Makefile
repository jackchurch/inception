
all:
	@bash srcs/requirements/tools/pre_build.sh
	@sudo docker compose -f ./srcs/docker-compose.yml  up -d
	@bash srcs/requirements/tools/post_build.sh

build:
	@bash srcs/requirements/tools/pre_build.sh
	@sudo docker compose -f ./srcs/docker-compose.yml  up -d --build
	@bash srcs/requirements/tools/post_build.sh

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml  down

fclean: clean
	@sudo docker volume rm srcs_web_v srcs_database_v  || true
	@sudo docker system prune -f -a --volumes
	@bash srcs/requirements/tools/remove_dir.sh

re: clean all

.PHONY: all clean fclean re build
