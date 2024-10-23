up:
	docker-compose up --detach

down:
	docker-compose down

build:
	docker-compose up --build --detach

restart:
	make down up

install:
	docker-compose up --build --detach
	docker exec -it scrumvoting_app composer install
	docker exec -it scrumvoting_app npm install

bash:
	docker exec -it scrumvoting_app bash

build-ui:
	docker exec -it scrumvoting_app npm run build