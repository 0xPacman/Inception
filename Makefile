all:
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d
up:
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d
down:
	@sudo docker-compose -f ./srcs/docker-compose.yml down
build:
	@sudo docker-compose -f ./srcs/docker-compose.yml build
re:
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build
logs:
	@sudo docker-compose -f ./srcs/docker-compose.yml logs
list:
	@sudo docker ps
vol:
	@mkdir /home/$USER/data /home/$USER/data/db /home/$USER/data/wp
clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo docker system prune -f
	@sudo docker image rm $$(sudo docker images -qa)
help:
	@echo "Makefile commonds:"
	@echo "up	bing up the containers"
	@echo "build	build the images"
	@echo "down	set down the containers"
	@echo "re	rebuild the containers"
	@echo "logs	view logs of the containers"
	@echo "list	list all docker containers"
	@echo "vol	create volumes folders"
	@echo "clean	clean everything"
