# Ensure all Documentation files exist
make setup
# Ensure PEP8 compatibility
make pep
# Run the tests
make tests
# Run the program
make run
# Create the executable file
make freeze
# Create the installable package
make package
# Clean the additionally created files
make clean
