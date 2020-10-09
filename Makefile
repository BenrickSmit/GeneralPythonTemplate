# Signifies our desired python version
# Makefile macros (or variables) are defined a little bit differently than traditional bash, keep in mind that in the Makefile there's top-level Makefile-only syntax, 
# and everything else is bash script syntax.
PYTHON = python3
YELLOW="\033[1;33m"
NC="\033[0m"
# .PHONY defines parts of the makefile that are not dependant on any specific file
# This is most often used to store functions
.PHONY = help setup test run freeze package pep clean

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands
# This target is executed whenever we just type `make`
.DEFAULT_GOAL = help

# The @ makes sure that the command itself isn't echoed in the terminal
help:
	@echo "${YELLOW}---------------HELP-----------------${NC}"
	@echo "${YELLOW}To setup the project type make setup${NC}"
	@echo "${YELLOW}To test the project type make test${NC}"
	@echo "${YELLOW}To run the project type make run${NC}"
	@echo "${YELLOW}To clean additional files/dirs in the project type make clean${NC}"
	@echo "${YELLOW}To autopep the project type make pep${NC}"
	@echo "${YELLOW}To create an executable with the project type make freeze${NC}"
	@echo "${YELLOW}To create an installable package type make package${NC}"
	@echo "${YELLOW}------------------------------------${NC}"

# This generates the desired project file structure
# A very important thing to note is that macros (or makefile variables) are referenced in the target's code with a single dollar sign ${}, but all script variables 
# are referenced with two dollar signs $${}
setup:
	@echo "${YELLOW}Install pipenv for use...${NC}"
	${PYTHON} -m pip install --user pipenv
	@echo "${YELLOW}Ensure the required packages are installed...${NC}"
	pipenv install -r requirements.txt
	@echo "${YELLOW}Ensure that the documentation is properly created...${NC}"
	chmod u+x init_documentation.sh
	./init_documentation.sh
	@echo "${YELLOW}Install Black, Flake8, Isort${NC}"
	pipenv install black flake8 isort --dev

	
# This ensure the python modules follow the correct format by running black, 
# flake8 and isort
pep:
	@echo "${YELLOW}Running PEP Formatters...${NC}"
	PATH_TO_CODE=GeneralPythonTemplate/
	pipenv run black ${PATH_TO_CODE}
	pipenv run isort .
	pipenv run flake8 ${PATH_TO_CODE}

# This allows the dev to create an installable package if the project is to be
# installed via pip in the future
package:
	# Ensure the packages required for setting up an installable package
	# are installed
	@echo "${YELLOW}Installing distribution archive dependencies...${NC}"
	pipenv install twine
	pipenv install setuptools wheel
	@echo "${YELLOW}Create Distribution Archive...${NC}"
	pipenv run ${PYTHON} setup.py sdist bdist_wheel
	
	# To allow the package to be uploaded to PyPI you must have registered
	# for an account at https://test.pypi.org/account/register/
	# Create the API Key at https://test.pypi.org/manage/account/#api-tokens
	# copy it, and use it with twine. Remember to write the API key down
	# since it will be the last time you see it. 
	# The command below will prompt you for a username and password.
	# You can use "__token__" as the username and pypi-<API_TOKEN>
	# as the password (naturally remove the <>) from the API key.
	@echo "${YELLOW}Uploading Distribution Archive to PyPi...${NC}"
	pipenv run ${PYTHON} -m twine upload --repository testpypi dist/*
	# Your package can now be installed with pip and the package name
	# FOR MORE INFORMATION LOOK AT "CreateDistributionArchive.sh"
	
# This allows the dev to freeze the current python system while creating an
# executable for later use
freeze:
	@echo "${YELLOW}Install the pre-requisites for PyInstaller...${NC}"
	pipenv install pyinstaller pefile 
	@echo "${YELLOW}Run PyInstaller with the pre-specified file...${NC}"
	pipenv run pyinstaller --onefile GeneralPythonTemplate/core.py --name template
	@echo "${YELLOW}For more information on PyInstaller use this:${NC}"
	@echo "${YELLOW}https://pyinstaller.readthedocs.io/en/stable/usage.html${NC}"
	@echo ""

# The ${} notation is specific to the make syntax and is very similar to bash's $() 
# This function uses pytest/unittest to test our source files
test:
	@echo "${YELLOW}Running Python module/class tests...${NC}"
	#${PYTHON} -m pytest
	${PYTHON} -m unittest test/test_basic.py
	${PYTHON} -m unittest test/test_advanced.py
	
run:
	@echo "${YELLOW}Running base Python program...${NC}
	"
	pipenv run ${PYTHON} GeneralPythonTemplate/core.py

# In this context, the *.project pattern means "anything that has the .project extension"
clean:
	@echo "${YELLOW}Cleaning Project...${NC}"
	rm -r docs
	rm -r dist
	
