all:
	@echo "\t\`make test\` to run tests"
	@echo "\t\`make dev\` to install development version"
	@echo "\t\`make lint\` to run static typing tests"


dev :
	@pipenv install --dev
	@pipenv run pip install -e .
	@echo "installed development version; run \`pipenv shell\` to enter activated environment."

test:
	@pipenv run pytest --cov-report term-missing --cov={{ cookiecutter.project_slug }} tests/


lint :
	@echo "======== PYLINT ======="
	@pipenv run pylint --rcfile=.pylintrc {{ cookiecutter.project_slug }} -f parseable -r n
	@echo "======== MYPY ======="
	@pipenv run mypy --ignore-missing-imports --follow-imports=skip {{ cookiecutter.project_slug }}
	@echo "======== PYCODESTYLE ======="
	@pipenv run pycodestyle {{ cookiecutter.project_slug }} --max-line-length=120
	@echo "======== PYDOCSTYLE  ======="
	@pipenv run pydocstyle {{ cookiecutter.project_slug }}
