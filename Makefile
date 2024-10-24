up:
	docker-compose up --detach

down:
	docker-compose down

build:
	docker-compose --env-file .env.local up --build --detach

restart:
	make down up

install:
	docker-compose --env-file .env.local up --build --detach
	docker exec -it scrumvoting_app composer install
	docker exec -it scrumvoting_app npm install

bash:
	docker exec -it scrumvoting_app bash

build-ui:
	docker exec -it scrumvoting_app npm run build