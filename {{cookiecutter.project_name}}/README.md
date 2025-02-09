# {{cookiecutter.project_name}}

{{cookiecutter.description}}


## Getting Started

1 - Clone this repo.

2 - Create an environment with the requirements. Assumes the project originator has spent time curating the environment
appropriately. There are default libraries in each project type `.yml` that will at least get you started.

  - if setting up an open source project
    ``` cmd
    > make env
    ```
  - if setting up an ESRI project
    ``` cmd
    > make env_arc
    ```

3 - Explore - If you are more into Python, a good place to start is `jupyter lab` from the root of the project, and 
look in the `./notebooks/iPython` directory. 

## Using Make - common commands

Based on the pattern provided in the Cookiecutter Data Science template by Driven Data this template streamlines a 
number of commands using the make command pattern.

- `make env` - builds the Conda environment with all the name and dependencies from `environment.yml` and installs the local project package `{{cookiecutter.support_library}}` using the command `python -m pip install -e ./src/src/{{cookiecutter.support_library}}` so you can easily test against the package as you are developing it.
- `make env_arc` - builds the Conda environment with all the name and dependencies from `environment_arc.yml` and installs the local project package `{{cookiecutter.support_library}}` using the command `python -m pip install -e ./src/src/{{cookiecutter.support_library}}` so you can easily test against the package as you are developing it.
- `make env_remove` - removes the Conda environment.
- `make env_remove_arc` - removes the arcpy Conda environment.
- `make env_clone` - designed for environments using the default Conda instance installed with ArcGIS Pro. It is similar to `make env`, except this command clones the `arcgispro-py3` environment. Otherwise, it still installs the packages listed in `environment_dev.yml` and installs the local package using `pip` as described above.
- `make docs` - builds Sphinx docs based on files in `./docsrc/source` and places them in `./docs`. This enables easy publishing in the master branch in GitHub.


4 - What else?

### Optional Folders to Utilize
    1 - conda-build (used for generating a conda package from your src folder)

    2 - conda-recipe (folder intended to hold the code to build the conda package)

    3 - docs/docsrc (folders to generate the project level documentation from code docstrings and project RST)


### Project Organization
_______________________
```
    ├── LICENSE
    ├── Makefile                <- Makefile with commands like `make data`
    ├── make.bat                <- Windows batch file with commands like `make data`
    ├── setup.py                <- Setup script for the library ({{ cookiecutter.support_library }})
    ├── .env                    <- Any environment variables here - created as part of project creation, 
    │                               but NOT syncronized with git repo for project.                
    ├── README.md               <- The top-level README for developers using this project.
    ├── data
    │   ├── empty               <- the data folder
    ├── docs                    <- A default Sphinx project; see sphinx-doc.org for details
    ├── notebooks               <- Jupyter notebooks. Naming convention is a 2 digits (for ordering),
    │   └── R                   <- a folder for R applications.
        └── iPython             <- iPython notebooks.
    │       └── notebook_template.ipynb <- A template for new notebooks.
    ├── references              <- Data dictionaries, manuals, and all other explanatory materials.
    ├── reports                 <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures             <- Generated graphics and figures to be used in reporting
    ├── environment.yml         <- Requirements file for reproducing the analysis project environment.
    │                               This includes far fewer dependencies and does not include arcpy.
    ├── environment_arc.yml     <- Requirements file for reproducing the analysis project environment.
    │                               This includes arcpy.
    └── src                     <- Source code for use in this project - all scripts, modules and code.
        └── {{ cookiecutter.support_library }} <- Library containing the bulk of code used in this 
                                                  project. 
```

<p><small>Project based on the <a target="_blank" href="https://github.com/Esri/cookiecutter-spatial-data-science">cookiecutter 
spatial data science project template</a>. This template, in turn, is simply an extension and light modification of the 
<a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data 
science project template</a>. cookiecutterdatascience</small></p>


