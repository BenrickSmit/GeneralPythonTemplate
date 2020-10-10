# -*- coding: utf-8 -*-
import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

import GeneralPythonTemplate

# This helps with a simple, but explicit, path modification to help remove the package properly for testing
# as such, when importing the project for testing use the following:
# from .context import sample_project_name
