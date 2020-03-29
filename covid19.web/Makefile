default:
	echo "Welcome to Project SiteCovid19"

backend:
	docker-compose run --rm --service-ports backend --shell

runserver:
	python src/manage.py runserver 0.0.0.0:8000 --insecure

start:
	python src/manage.py migrate
	python src/manage.py createsuperuser