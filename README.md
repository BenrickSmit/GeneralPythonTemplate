# Description
This is a general python template project structure. It comes with auto
documentation, autopep, automated testing (using unittest) and a makefile
to help with the execution.

init_documentation.sh is used to create the documentation automatically
init_program.sh is used to run all the make commands. Using make/ make help
will bring up a list of possible commands. The proper order of the commands are,
however, make setup pep tests run. Should you wish to create an executable
or a package to publish to PyPi, use make freeze, or make package respectively.

To clean up all created files, except the respective __pycache__ files, use
make clean in the source directory

When you use the template make sure to do the following:
 - Change all occurrences of GeneralPythonTemplate with your project name
    make sure to add in no spaces.
 - Add in tests in the test folder by following the example, and all tests
    need to start with test*.py. unittest will discover all the tests.
 - Add in all required packages in the requirements.txt file (the project
    uses pipenv)
 - Ensure you have the proper License and you added in the License code at the
    top of all your project files

Find the project [here](github.com/BenrickSmit/GeneralPythonTemplate]), if you did not find this project on my github.

# Features
This states the current features provided by the program

# Future Enchancements
This gives information on the future changes that are likely to be implemented.

# How to Run
This gives information on how to normally run the python program

# How to Run Unit Tests
This gives information on how to normally run the python program's tests

# Key Dependencies
This gives information on the dependencies required by the python program

# How to contribute
This states how others can contribute to the project, and what styles to use

# License
This states the [licence](LICENSE)

