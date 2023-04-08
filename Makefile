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
bundle-install:
	docker compose run --rm web bundle install
db-create:
	docker compose run --rm web bundle exec rake db:create
db-migrate:
	docker compose run --rm web bundle exec rake db:migrate
db-rollback:
	docker compose run --rm web bundle exec rake db:rollback
db-drop:
	docker compose run --rm web bundle exec rake db:drop
