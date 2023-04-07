run-tests:
	docker compose run --rm web bundle exec rspec spec
run-app:
	docker compose up
run-app-d:
	docker compose up -d
stop-app:
	docker compose down
stop-app-d:
	docker compose down -v
app-build:
	docker compose up --build
app-build-d:
	docker compose up --build -d
