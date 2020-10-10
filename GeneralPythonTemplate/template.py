# This is a template class for Python Comments using simple python single-line
# comments, and docstrings

# This is a programmer comment: e.g. This function slows down execution
# This Google Style docstring is often used for complex functions
def random_number_generator(arg1, arg2):
    """
    Summary line.

    Extended description of function in a NumPy style docstring.

    Parameters:
        arg1 : int
                Description of arg1
        arg2 : str
                Description of arg2

    Returns:
        int
                Description of return value

    Raises:
        IOError: An error occurred accessing the values.

    .. note::
        An example of a note in reStructuredText

    .. warning::
        Never, ever, use this code!

    .. versionadded:: 0.0.1
        It's okay to use this code.
    """
    return 42


# For simple functions you can use a simple docstring to explain what the
# funciton is responsible for
def add(a, b):
    """Add two numbers and return the result."""
    return a + b


# NOTE: The above docstrings can be easily parsed with Sphinx (https://www.sphinx-doc.org/en/master/).


# How to use Sphinx
# -----------------
# Sphinx is written by Georg Brandl and licenced under the BSCD Licence.
# Sphinx is one of the most popular Python Documentation Generator tools out there. it
# converts reStructuredText() markup language into a range of output formats
# including HTML, LaTeX, Manual Pages, and Plain text
# There is also great, free hosting for your sphinx docs: READ THE DOCS (http://readthedocs.org/)
# This can be configured with commit hooks to your source repo so that rebuilding
# your documentation will happen automatically
# When run, Sphinx will import your code and using Python's introspection featrues
# it will extract all function, method, and class signatures. It will also extract
# the accompanying docstrings, and compile it all into well structured, and easily
# readable documentation for your project.
# Sphinx can handle the following:
# 	~ Different Output Formats: (HTML, LaTeX, ePub, Texinfo, Plain text, etc)
# 	~ Extensive cross-references: Semantic-markup and automatic links for
# 	  functions, classes, citations, etc
# 	~ Hierarchical Structure: Easy definition of a document tree, with auto
# 	  links to siblings, parents, and children
# 	~ Automatic indices: general index as well as language-specific module indices
# 	~ Code handling: Automatic highlighting using the Pygments highlighter
# 	~ Extensions: automatic testing of code snippits, inclusing of docstrings
# 	  from python modules (API docs) and more
# 	~ Contributed extensions: more than 50 extensions, contributed by users,
# 	  installable from PyPI

# To install and use Sphinx: pip install -U Sphinx

# How to set up the documentation sources
# The root dir of a sphinx collection of plain text document sources is call the
# source directory. This dir also contains the Sphinx Config file conf.py where you
# can configure all aspects of how Sphinx reads your sources, and builds your documentation
# Sphinx comes with a script, called "sphinx-quickstart" that sets up a source dir
# and creates a default conf.py with the most useful configuration values from
# a few questions it asks you.
# To use the quickstart use: sphinx-quickstart

# Defining Document Structure
# You just ran sphinx-quickstart and it created a source dir with a conf.py and a
# master document, index.rst. The main function of the master document is to serve
# as a welcome page. It contains the root of the "table of contents tree" (toctree).
# The toctree is initially empty and looks like the following:
# .. toctree::
#    ::maxdepth: 2

# you can add documents by listing them int he content of the directive, i.e.:
# .. toctree::
#    :maxdepth: 2
#
#    usage/installation
#    usage/quickstart
#    ...

# Adding content
# In Sphinx source files, you can use most features of standard reStructuredText.
# You can add cros-file references in a portable way (which works for all output
# types) using the ref role.

# Running the Build
# Now that you have added some files and content, let's make a first build of the
# docs. A build is started with the sphinx-build program
# spinx-build -b html <sourcedir> <builddir>
# remove the <sourcedir> and <builddir> with the approriate source dir and
# build directory (note: builddir referes to the directory where you'd like
# to place the build documentation.
# -b selects a builder, in this case html.
# If you've run the sphinx-qiuckstart, then you get a  Makefile and a make.bat
# which makes life even easier. The command abov can be replaced with
# make html
# or make latexpdf for a pdf file

# Documenting Objects
# One of Sphinx's main objectives is easy documentaiton of objects in any domain
# A domain is a collection of object types that belong together, complete with
# markup to create and reference descriptions of these objects.
# The most prominent domain is the python domain For example, to document
# python's build in enumerate() function, you would add this to one of your
# source files
# .. py:function:: enumerate(sequence[, start=0])
#
#    Return an iterator that yields tuples of an index and an item of the *sequence*.
#    (and so on.)
# The default domain is however python, so it is also possible to remove the
# "py::" from the directives.

# Basic Configuration
# Earlier we mentioned that conf.py controls how Sphinx proceses your documents.
# in this file, which is executed as a Python source file, you assign configuration
# values. For advanced users: since it is executed by Sphinx, oyu can do non-trivial
# tasks in it, like extending sys.path or importing a module to find out the version
# you are documenting.

# Autodoc
# When documenting python code, it is common to put a lot of documentation in the
# source files, in documentation strings. Sphinx support the inclusion of docstrings
# from your modules with an *extension* called autodoc.
# In order to use autodoc, you need to activate it in the conf.py by putting the
# string "sphinx.ext.autodoc" into the list of assigned extensions config value
# extensions = ['sphinx.ext.autodoc']

# You have a few aditional directive at your disposal. For example, to document
# the function io.open(), reading its signature and docstring from the source file
# you'd write
# .. autofunction:: io.open
# You can also document whole classes or even modules automatically, using member
# options for the auto directives, e.g.
# .. automodule:: io
#    :members:
# Autodoc needs to import your modules in order to extract the docstrings. Thus,
# you must add the appropriate path to sys.path in your conf.py

# Intersphinx
# Many Sphinx documents are published on the internet. When you want to make links
# such as documents from your documentation, you can do it with
# Sphinx.ext.intersphinx
# In order to use intersphinx, you need to activate it in conf.py by putting the
# string "sphinx.ext.intersphinx" into the extensions list, and set up the
# intersphinx_mapping config value.
# for example, to link to io.open() in the Python library manual, you need to setup
# you intersphinx_mapping as such:
# intershpinx_mapping = {'python': ('https://docs.python.org/3', None)}
# Now we can write a cross-reference such as :py:func:`io.open`. Any cross-reference
# that has no matching target in the current documentaiton set, will be looked up
# in the documentation sets configured in intersphinx_mapping (which requires the
# URL in order to download the list of valid targets).

# Quick Sphinx Tutorial
# It might be necessary to create a virtual environment for your project, so
# go to your root directory and execute:
# virtualenv -p python3 <name of the virtual environment> && source <name of virtualenv>/bin/activate
# Install the project requirements when needed
# pip install -r requirements.txt
# To install Sphinx if it's not yet installed execute:
# pip install Sphinx
# Create a docs directory and cd into it, i.e.
# mkdir docs && cd docs
# Setup Sphinx:
# sphinx-quickstart
# and follow the prompts given
# Open the source/conf.py file
# Configure the path to the root directory by uncommenting the lines 15-17, i.e.:
# # import os
# # import sys
# # sys.path.insert(0, os.path.abspath('.'))
# Add in below line 17: sys.setrecursionlimit(1500) and change the
# '.' in line 17 to ('../..')
# Uncomment hte latex elements from lines 114-130
# Open the index.rst and change the content to the following:
# Documenttaion for the Code
# **************************
# .. toctree::
#    :maxdepth: 2
#    :caption: Contents:
#
# TeacherAPI main
# ==================
# .. automodule:: app
#    :members:
#
# TeacherAPI controller
# ======================
# .. automodule:: teacherAPI.controller
#    :members:
#
# TeacherAPI models
# ===================
# .. automodule:: teacherAPI.models
#    :members:
# ...

# Still inside the docs directory, run the following
# make html
# to make an html file.

## For more information, look at: https://pythonhosted.org/an_example_pypi_project/sphinx.html
## Additional information can also be found here: https://www.writethedocs.org/guide/writing/beginners-guide-to-docs/
## A reStructuredText primer can be found here: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html


# Setting up setuptools
# Follow the directions on http://pypi.python.org/pypi/setuptools for your os

# Typical setup.py file
# import os
# from setuptools import setup
#
# Utility function to read the README file.
# Used for the long_description.  It's nice, because now 1) we have a top level
# README file and 2) it's easier to type in the README file than to put a raw
# string in below ...
# def read(fname):
#     return open(os.path.join(os.path.dirname(__file__), fname)).read()
#
# setup(
#     name = "an_example_pypi_project",
#     version = "0.0.4",
#     author = "Andrew Carter",
#     author_email = "andrewjcarter@gmail.com",
#     description = ("An demonstration of how to create, document, and publish "
#                                    "to the cheese shop a5 pypi.org."),
#     license = "BSD",
#     keywords = "example documentation tutorial",
#     url = "http://packages.python.org/an_example_pypi_project",
#     packages=['an_example_pypi_project', 'tests'],
#     long_description=read('README'),
#     classifiers=[
#         "Development Status :: 3 - Alpha",
#         "Topic :: Utilities",
#         "License :: OSI Approved :: BSD License",
#     ],
# )

# The basics of using setup.py is:
# python setup.py <some_commands> <options>
# to see all commands type
# python setup.py --help-commands

# More information found here: https://pythonhosted.org/an_example_pypi_project/setuptools.html#installing-setuptools-and-easy-install


# Good Python Programming Practice, for use in another file.
