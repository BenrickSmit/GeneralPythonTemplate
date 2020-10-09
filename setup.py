# -*- coding: utf-8 -*-
from setuptools import setup
from setuptools import find_packages


def read(string_filename):
     return open(os.path.join(os.path.dirname(__file__), string_filename)).read()

setup(
    name="example-pkg-YOUR-USERNAME-HERE", # Replace with your own username
    version="0.0.1",
    author="Example Author",
    author_email="author@example.com",
    description="A small example package",
    long_description=read("README.md"),
    license=read("LICENSE"),
    long_description_content_type="text/markdown",
    url="https://github.com/pypa/sampleproject",
    packages=find_packages(),
    classifiers=[
    	"Developement Status :: 1 - Planning",
    	#"Development Status :: 2 - Pre-Aplha",
    	#"Development Status :: 3 - Alpha",
    	#"Development Status :: 4 - Beta",
    	#"Development Status :: 5 - Production/Stable",
    	#"Development Status :: 6 - Mature",
    	#"Development Status :: 7 - Inactive",
    	"Environment :: Console",
    	#"Environment :: GPU",
    	#"Environment :: GPU :: NVIDIA CUDA",
    	#"Environment :: Handhelds/PDAs",
    	#"Environment :: No Input/Outupt(Daemon)",
    	#"Environment :: OpenStack",
    	#"Environment :: Other Environment",
    	#"Environment :: Plugins",
    	#"Environment :: Web Environment",
    	#"Environment :: Win32",
    	#"Environment :: X11 Applications",
	#"Framework :: AWS CDK",
	#"Framework :: AsyncIO",
	#"Framework :: Buildout",
	#"Framework :: CherryPy",
	#"Framework :: Django",
	#"Framework :: Flake8",
	#"Framework :: Flask",
	#"Framework :: IDLE",
	#"Framework :: IPython",
	#"Framework :: Jupyter",
	#"Framework :: Matplotlib",
	#"Framework :: Odoo",
	#"Framework :: Pytest",
	#"Framework :: Robot Framework",
	#"Framework :: Scrapy",
	#"Intended Audience :: Other Audience",
	#"Intended Audience :: Manufacturing",
	#"Intended Audience :: Legal Industry",
	#"Intended Audience :: Information Technology",
	#"Intended Audience :: Healthcare Industry",
	#"Intended Audience :: Financial and Insurance Industry",
	#"Intended Audience :: End Users/Desktop",
	#"Intended Audience :: Education",
	#"Intended Audience :: Developers",
	#"Intended Audience :: Customer Service",
        #"License :: OSI Approved :: MIT License",
        #"License :: Freeware",
        #"License :: Free For Home Use",
        #"License :: Free For Educational Use",
        #"License :: Freely Distributable",
        #"License :: Free for non-commercial use",
        #"License :: OSI Approved",
        #"License :: OSI Approved :: Apache Software License",
        #"License :: OSI Approved :: Apple Public Source License",
        #"License :: OSI Approved :: BSD License",
        #"License :: OSI Approved :: Atrtistic License",
        #"License :: OSI Approved :: Boost Software License 1.0 (BSL-1.0)",
        #"License :: OSI Approved :: Eclipse Public License 1.0 (EPL-1.0)",
        #"License :: OSI Approved :: Eclipse Public License 2.0 (EPL-2.0)",
        #"License :: OSI Approved :: European Union Public Licence 1.2 (EUPL 1.2)",
        #"License :: OSI Approved :: GNU General Public License (GPL)"
        #"License :: OSI Approved :: GNU General Public License v2 (GPLv2)",
        #"License :: OSI Approved :: GNU General Public License v2 or later (GPLv2+)",
        #"License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        #"License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)",
        #"License :: OSI Approved :: GNU Lesser General Public License v2 (LGPLv2)",
        #"License :: OSI Approved :: GNU Lesser General Public License v2 or later (LGPLv2+)",
        #"License :: OSI Approved :: GNU Lesser General Public License v3 (LGPLv3)",
        #"License :: OSI Approved :: GNU Lesser General Public License v3 or later (LGPLv3+)",
        #"License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)",
        #"License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)",
        #"License :: OSI Approved :: IBM Public License",
        #"License :: OSI Approved :: Intel Open Source License",
        #"License :: OSI Approved :: Mozilla Public License 1.0 (MPL)",
        #"License :: OSI Approved :: Mozilla Public License 1.1 (MPL 1.1)",
        #"License :: OSI Approved :: Mozilla Public License 2.0 (MPL 2.0)",
        #"License :: OSI Approved :: Open Software License 3.0 (OSL-3.0)",
        #"License :: OSI Approved :: Python License (CNRI Python License)",
        #"License :: OSI Approved :: Qt Public License (QPL)",
        #"License :: Public Domain",
        "Operating System :: OS Independent",
        #"Operating System :: MacOS",
        #"Operating System :: BeOS",
        #"Operating System :: Android",
        #"Operating System :: Microsoft",
        #"Operating System :: Unix",
        #"Operating System :: iOS",
        #"Programming Language :: C",
        #"Programming Language :: C#",
        #"Programming Language :: C++",
        #"Programming Language :: Cython",
        #"Programming Language :: F#",
        #"Programming Language :: Java",
        #"Programming Language :: JavaScript",
        #"Programming Language :: Kotlin",
        #"Programming Language :: Objective C",
        #"Programming Language :: PHP",
        #"Programming Language :: Perl",
        #"Programming Language :: Python",
        "Programming Language :: Python :: 3",
        #"Programming Language :: R",
        #"Programming Language :: SQL",
        #"Topic :: Adaptive Technologies",
        #"Topic :: Artistic Software",
        #"Topic :: Communications",
        #"Topic :: Database",
        #"Topic :: Database :: Database Engines/Servers",
        #"Topic :: Database :: Front-Ends",
        #"Topic :: Desktop Environment",
        #"Topic :: Desktop Environment :: File Managers",
        #"Topic :: Desktop Environment :: GNUstep",
        #"Topic :: Desktop Environment :: Gnome",
        #"Topic :: Desktop Environment :: K Desktop Environment (KDE)",
        #"Topic :: Documentation",
        #"Topic :: Education",
        #"Topic :: Games/Entertainment",
        #"Topic :: Home Automation",
        #"Topic :: Internet",
        #"Topic :: Multimedia",
        #"Topic :: Office/Business",
        #"Topic :: Printing",
        #"Topic :: Religion",
        #"Topic :: Scientific/Engineering",
        #"Topic :: Scientific/Engineering :: Artificial Intelligence",
        #"Topic :: Security",
        #"Topic :: Sociology",
        #"Topic :: Software Development",
        #"Topic :: Software Development :: User Interfaces",
        #"Topic :: Software Development :: Testing",
        #"Topic :: Software Development :: Pre-processors",
        #"Topic :: Software Development :: Quality Assurance",
        #"Topic :: Software Development :: Libraries",
        #"Topic :: Software Development :: Embedded Systems",
        #"Topic :: Software Development :: Documentation",
        #"Topic :: Software Development :: Debuggers",
        #"Topic :: Software Development :: Compilers",
        #"Topic :: Software Development :: Build Tools",
        #"Topic :: Software Development :: Widget Sets",
        #"Topic :: System",
        #"Topic :: Terminals",
        #"Topic :: Text Editors",
        "Topic :: Utilities",
        #"Topic :: Text Processing",
    ],
    python_requires='>=3.5',
)

# For more classifiers look to: https://pypi.org/classifiers/