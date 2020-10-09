# Signifies our desired python version
# Makefile macros (or variables) are defined a little bit differently than traditional bash, keep in mind that in the Makefile there's top-level Makefile-only syntax, 
# and everything else is bash script syntax.
PYTHON = python3

# Define a function to help with readability
define colorecho
      @tput setaf 3
      @tput bold
      @echo $1
      @tput sgr0
endef

# .PHONY defines parts of the makefile that are not dependant on any specific file
# This is most often used to store functions
.PHONY = help setup test run freeze package pep clean

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands
# This target is executed whenever we just type `make`
.DEFAULT_GOAL = help

# The @ makes sure that the command itself isn't echoed in the terminal
help:
	$(call colorecho,"---------------HELP-----------------" $(LD))
	$(call colorecho,"To setup the project type make setup${}" $(LD))
	$(call colorecho,"To test the project type make test${}" $(LD))
	$(call colorecho,"To run the project type make run${}" $(LD))
	$(call colorecho,"To clean additional files/dirs in the project type make clean${}" $(LD))
	$(call colorecho,"To autopep the project type make pep${}" $(LD))
	$(call colorecho,"To create an executable with the project type make freeze${}" $(LD))
	$(call colorecho,"To create an installable package type make package${}" $(LD))
	$(call colorecho,"------------------------------------" $(LD))

# This generates the desired project file structure
# A very important thing to note is that macros (or makefile variables) are referenced in the target's code with a single dollar sign ${}, but all script variables 
# are referenced with two dollar signs $${}
setup:
	$(call colorecho,"Install pipenv for use..." $(LD))
	${PYTHON} -m pip install --user pipenv
	$(call colorecho,"Ensure the required packages are installed..." $(LD))
	pipenv install -r requirements.txt
	$(call colorecho,"Ensure that the documentation is properly created..." $(LD))
	chmod u+x init_documentation.sh
	./init_documentation.sh
	$(call colorecho,"Install Black, Flake8, Isort" $(LD))
	pipenv install black flake8 isort --dev
	$(call colorecho,"" $(LD))

	
# This ensure the python modules follow the correct format by running black, 
# flake8 and isort
pep:
	$(call colorecho,"Running PEP Formatters..." $(LD))
	PATH_TO_CODE=GeneralPythonTemplate/
	pipenv run black ${PATH_TO_CODE}
	pipenv run isort .
	pipenv run flake8 ${PATH_TO_CODE}
	$(call colorecho,"" $(LD))

# This allows the dev to create an installable package if the project is to be
# installed via pip in the future
package:
	# Ensure the packages required for setting up an installable package
	# are installed
	$(call colorecho,"Installing distribution archive dependencies..." $(LD))
	pipenv install twine
	pipenv install setuptools wheel
	$(call colorecho,"Create Distribution Archive..." $(LD))
	pipenv run ${PYTHON} setup.py sdist bdist_wheel
	
	# To allow the package to be uploaded to PyPI you must have registered
	# for an account at https://test.pypi.org/account/register/
	# Create the API Key at https://test.pypi.org/manage/account/#api-tokens
	# copy it, and use it with twine. Remember to write the API key down
	# since it will be the last time you see it. 
	# The command below will prompt you for a username and password.
	# You can use "__token__" as the username and pypi-<API_TOKEN>
	# as the password (naturally remove the <>) from the API key.
	$(call colorecho,"Uploading Distribution Archive to PyPi..." $(LD))
	pipenv run ${PYTHON} -m twine upload --repository testpypi dist/*
	# Your package can now be installed with pip and the package name
	# FOR MORE INFORMATION LOOK AT "CreateDistributionArchive.sh"
	$(call colorecho,"" $(LD))

# This allows the dev to freeze the current python system while creating an
# executable for later use
freeze:
	$(call colorecho,"Install the pre-requisites for PyInstaller..." $(LD))
	pipenv install pyinstaller pefile 
	$(call colorecho,"Run PyInstaller with the pre-specified file..." $(LD))
	pipenv run pyinstaller --onefile GeneralPythonTemplate/core.py --name template
	$(call colorecho,"For more information on PyInstaller use this:" $(LD))
	$(call colorecho,"https://pyinstaller.readthedocs.io/en/stable/usage.html" $(LD))
	$(call colorecho,"" $(LD))

# The ${} notation is specific to the make syntax and is very similar to bash's $() 
# This function uses pytest/unittest to test our source files
test:
	$(call colorecho,"Running Python module/class tests..." $(LD))
	#${PYTHON} -m pytest
	${PYTHON} -m unittest test/test_basic.py
	${PYTHON} -m unittest test/test_advanced.py\
	$(call colorecho,"" $(LD))
	
run:
	$(call colorecho,"Running base Python program..." $(LD))
	pipenv run ${PYTHON} GeneralPythonTemplate/core.py
	$(call colorecho,"" $(LD))

# In this context, the *.project pattern means "anything that has the .project extension"
clean:
	$(call colorecho,"Cleaning Project..." $(LD))
	rm -r docs
	rm -r dist
	$(call colorecho,"" $(LD))
	
