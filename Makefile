.PHONY: install lint test run build docker

install:
	python -m pip install --upgrade pip
	pip install -r requirements-dev.txt

lint:
	black --check . || (echo "Run black ." && exit 1)
	isort --check-only . || (echo "Run 'isort -rc .' to fix imports" && exit 1)
	flake8 . || (echo "Fix lint issues" && exit 1)

test:
	pytest -q

run:
	uvicorn src.app.main:app --reload --host 0.0.0.0 --port 8000

docker:
	docker build -t python-mastery-roadmap:latest .