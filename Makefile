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

docker-build:
	docker build -f Dockerfile.production -t biryukovpyu/devops-for-programmers-project-lvl1 .

docker-push:
	docker push biryukovpyu/devops-for-programmers-project-lvl1

docker-start:
	docker run -e NODOS_HOST=0.0.0.0 -p 8080:8080 biryukovpyu/devops-for-programmers-project-lvl1
