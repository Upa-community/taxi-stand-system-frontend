docker_up:
	docker compose -f docker-compose.yml up -d --build
	docker compose -f docker-compose.yml exec web yarn install
	docker compose -f docker-compose.yml exec web yarn dev
