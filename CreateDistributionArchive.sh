# PS: RUN THIS FROM THE SAME DIRECTORY AS setup.py as this will create a 
#	pip installable package
# Generate Distribution Archive for Packages
python3 -m pip install --user --upgrade setuptools wheel
python3 setup.py sdist bdist_wheel

# The above will generate two files in the /dist directory
#	*.tar.gz 	-> The source archive
#	*.whl		-> The Built Distribution
# Newer version of pip preferentially install built distributions, but 
# will fall back to source archives if needed. You should always upload
# a source archive and provide built archives for the platforms your 
# project is compatible with.

# To upload your package you'll need to create an account (Test) PyPI.
# Test PyPI is a separate instance of the package index intended for
# testing and experimentation.
# Go to: https://test.pypi.org/account/register/ to register for an
# account.

# Afterwards you'll be able to create a new API token to securely
# upload your project.
# To create an API token go to:
# https://test.pypi.org/manage/account/#api-tokens
# NOTE: DON"T CLOSE THE PAGE UNTIL YOU HAVE COPIED AND SAVED THE TOKEN
# -- YOU WON"T SEE THAT TOKEN AGAIN!

# Once you've registered you can upload the package with twine
python3 -m pip install --user --upgrade twine
python3 -m twine upload --repository testpypi dist/*
# This will prompt you for a username and password. Use __token__ for
# the username. For the password, use the token value including the 
# "pypi-" prefix - without the quotes

# To install your newly uploaded package you can use Pip and virtualenv
# python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps example-pkg-YOUR-USERNAME-HERE
