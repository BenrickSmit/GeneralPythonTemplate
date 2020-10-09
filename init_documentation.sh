##-----------------------------------------------------------------------------
## SECTION: Setup some Variables (Freely Changable)
##-----------------------------------------------------------------------------
# Set some variables for use with Sphinx for documentation
# NOTE: Set the STRING_PROJECT_NAME to the same name as the project's base name
# NOTE: For any spaces, e.g. in a name, replace them with a _, the script will take care
# 	of it later.
STRING_PROJECT_NAME="GeneralPythonTemplate"
STRING_AUTHOR_NAME="John_Smith"
STRING_PROJECT_VERSION="0.0.1"


##-----------------------------------------------------------------------------
## SECTION: Automated Docs Generator based on Project data (DON'T TOUCH)
##-----------------------------------------------------------------------------
## Begin Script Execution
# Install Sphinx if its not installed
pip install -U Sphinx


# Setup the documets folder where the documentition will be stored
doc_dir=docs
rm -r ${doc_dir}
mkdir ${doc_dir}


# Run the Sphinx Quickstart menu with some necessary default options
# There is an error with sphinx-quickstart and a space in any strings due to how bash 
# functions , so use single strings with _ for spaces
sphinx-quickstart -q --sep -p ${STRING_PROJECT_NAME} -a ${STRING_AUTHOR_NAME} -v ${STRING_PROJECT_VERSION} --ext-autodoc --ext-doctest --ext-intersphinx --ext-ifconfig --ext-githubpages --makefile --batchfile -l en ${doc_dir}


# Find all .py files in the project directory, and add them to the index.rst file in
# docs/source/index.rst. This is so that the Sphinx autodoc feature can find all 
# docstrings and correctly add them to the required file
file_array=("${STRING_PROJECT_NAME}"/*)
index_loc=${doc_dir}/source/index.rst
for file_name in "${file_array[@]}"; do
	# Determine whether the file is a __init__.py file (which denotes a package
	# instead of a normal module
	if [ "${file_name}" != "${STRING_PROJECT_NAME}/__init__.py" ]; then
		# Replace all "/" in the path with a "." for use in the index.rst file
		to_replace="/"
		replace_with="."
		final_replace=" "
		index_file_name=${file_name//${to_replace}/${replace_with}}
		
		# Replace the .py extention in the path with an empty string for use
		# in the index.rst
		to_replace=".py"
		replace_with=""
		index_file_name=${index_file_name/${to_replace}/${replace_with}}
		
		# Write the necessary Sphinx instructions to index.rst. This is 
		# so that Sphinx can autodoc the modules and their documentation
		# as well as autotest, should you add doctest strings
		replace_with="."
		title_name=${index_file_name/${replace_with}/${final_replace}}
		title_name=${title_name^}
		printf '\n\n\n' >> ${index_loc}
		echo ${title_name} >> ${index_loc}
		echo '---------------------------------------' >> ${index_loc}
		echo '.. automodule::' ${index_file_name} >> ${index_loc}
		echo '   :members:' >> ${index_loc}
		echo "Added ${file_name} to index.rst"
	fi
done


# This uncomments lines 13-15 in the docs/source/conf.py file so as to allow
# Sphinx to find the modules in the project directory. For this the 
# ${STRING_PROJECT_NAME} MUST be set to the project name exactly
PATH_CONFIG_FILE=${doc_dir}/source/conf.py
sed -i '13 s/# //' ${PATH_CONFIG_FILE}
sed -i '14 s/# //' ${PATH_CONFIG_FILE}
sed -i '15 s/# //' ${PATH_CONFIG_FILE}
sed -i "15 s|'\.'|'\.\./\.\.'|" ${PATH_CONFIG_FILE}


# Remove any _ that separate the project name and author name in the
# docs/source/conf.py file for correct project names 
sed -i "20 s/_/ /" ${PATH_CONFIG_FILE}
sed -i "21 s/_/ /" ${PATH_CONFIG_FILE}
sed -i "22 s/_/ /" ${PATH_CONFIG_FILE}


# Use "make" to let Sphinx create epub and html documentation for your code.
cd ${doc_dir}
make epub
make html
cd ..

