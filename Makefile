# Signifies our desired python version
# Makefile macros (or variables) are defined a little bit differently than traditional bash, keep in mind that in the Makefile there's top-level Makefile-only syntax, 
# and everything else is bash script syntax.
PYTHON = python3
PROJECT_DIR = GeneralPythonTemplate

# Define a function to help with readability
define colorecho
      @tput setaf 3
      @tput bold
      @echo $1
      @tput sgr0
endef

# .PHONY defines parts of the makefile that are not dependant on any specific file
# This is most often used to store functions
.PHONY = tests help setup run freeze package pep clean

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands
# This target is executed whenever we just type `make`
.DEFAULT_GOAL = help

# The @ makes sure that the command itself isn't echoed in the terminal
help:
	@echo ""
	$(call colorecho, "--------------------------HELP----------------------------")
	$(call colorecho, "To setup the project type make setup")
	$(call colorecho, "To test the project type make tests")
	$(call colorecho, "To run the project type make run")
	$(call colorecho, "To clean created files/dirs type make clean")
	$(call colorecho, "To autopep the project type make pep")
	$(call colorecho, "To create an executable type make freeze")
	$(call colorecho, "To create an installable package type make package")
	$(call colorecho, "----------------------------------------------------------")
	@echo ""

# This generates the desired project file structure
# A very important thing to note is that macros (or makefile variables) are referenced in the target's code with a single dollar sign ${}, but all script variables 
# are referenced with two dollar signs $${}
setup:
	$(call colorecho, ">>>> Install pipenv for use...")
	${PYTHON} -m pip install pipenv
	$(call colorecho, ">>>> Ensure the required packages are installed...")
	@pipenv install -r requirements.txt
	$(call colorecho, ">>>> Ensure the documentation is created with Sphinx...")
	@chmod u+x init_documentation.sh
	@./init_documentation.sh
	@echo ""
	$(call colorecho, ">>>> Install autopepping packages...")
	@pipenv install --pre black --dev
	@pipenv install flake8 --dev
	@pipenv install isort --dev
	@echo ""
# This ensure the python modules follow the correct format by running black, 
# flake8 and isort
pep:
	$(call colorecho, ">>>> Running PEP Formatters...")
	@PATH_TO_PROJECT=${PROJECT_DIR}"/*"
	@pipenv run black .
	@pipenv run isort .
	@pipenv run flake8 ${PATH_TO_PROJECT}
	@echo ""

# This allows the dev to create an installable package if the project is to be
# installed via pip in the future
package:
	# Ensure the packages required for setting up an installable package
	# are installed
	$(call colorecho, ">>>> Installing distribution archive dependencies...")
	@pipenv install twine --dev
	@pipenv install setuptools wheel --dev
	$(call colorecho, ">>>> Create Distribution Archive...")
	@pipenv run ${PYTHON} setup.py sdist bdist_wheel
	
	# To allow the package to be uploaded to PyPI you must have registered
	# for an account at https://test.pypi.org/account/register/
	# Create the API Key at https://test.pypi.org/manage/account/#api-tokens
	# copy it, and use it with twine. Remember to write the API key down
	# since it will be the last time you see it. 
	# The command below will prompt you for a username and password.
	# You can use "__token__" as the username and pypi-<API_TOKEN>
	# as the password (naturally remove the <>) from the API key.
	$(call colorecho, ">>>> Uploading Distribution Archive to PyPi...")
	@#pipenv run ${PYTHON} -m twine upload --repository testpypi dist/*
	# Your package can now be installed with pip and the package name
	# FOR MORE INFORMATION LOOK AT "CreateDistributionArchive.sh"
	@echo ""

# This allows the dev to freeze the current python system while creating an
# executable for later use
freeze:
	$(call colorecho, ">>>> Install the pre-requisites for PyInstaller...")
	@pipenv install pyinstaller pefile --dev
	$(call colorecho, ">>>> Run PyInstaller with the pre-specified file...")
	@pipenv run pyinstaller --onefile ${PROJECT_DIR}/core.py --name template
	$(call colorecho, ">>>> For more information on PyInstaller use this:")
	$(call colorecho, ">>>> https://pyinstaller.readthedocs.io/en/stable/usage.html")
	@echo ""

# The ${} notation is specific to the make syntax and is very similar to bash's $() 
# This function uses pytest/unittest to test our source files
tests:
	$(call colorecho, ">>>> Running Python module/class tests...")
	@#${PYTHON} -m pytest
	$(call colorecho, ">>>> NOTE: unittest requires the tests to match with test*.py")
	@pipenv run ${PYTHON} -m unittest discover -v
	@#pipenv run ${PYTHON} -m unittest -v
	@echo ""

run:
	$(call colorecho, ">>>> Running base Python program...")
	@pipenv run ${PYTHON} ${PROJECT_DIR}/core.py
	@echo ""

# In this context, the *.project pattern means "anything that has the .project extension"
clean:
	$(call colorecho, ">>>> Cleaning Project...")
	@[ -d build ] && rm -rf build || echo "build does not exist; Can't delete."
	@[ -d docs ] && rm -rf docs || echo "docs does not exist; Can't delete."
	@[ -d dist ] && rm -rf dist || echo "dist does not exist; Can't delete."
	@[ -e Pipfile ] && rm -rf Pipfile || echo "Pipfile does not exist; Can't delete."
	@[ -e Pipfile.lock ] && rm -rf Pipfile.lock || echo "Pipfile.lock does not exist; Can't delete."
	@[ -e *.spec ] && rm -rf *.spec || echo "No .spec file exist; Can't delete."
	@echo ""
	
