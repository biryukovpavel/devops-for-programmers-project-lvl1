server:
	npx nodos server

test:
	npm -s test

compose-test:
	docker-compose -f docker-compose.yml up --abort-on-container-exit

compose-start:
	docker-compose up -d

compose-setup: compose-down compose-build compose-start

compose-build:
	docker-compose build

compose-down:
	docker-compose down || true

compose-stop:
	docker-compose stop || true

compose-restart:
	docker-compose restart

compose-logs:
	docker-compose logs -f

compose-bash:
	docker-compose run app bash
