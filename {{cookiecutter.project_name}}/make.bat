:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: LICENSING                                                                    :
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Copyright 2020 Esri
::
:: Licensed under the Apache License, Version 2.0 (the "License"); You
:: may not use this file except in compliance with the License. You may
:: obtain a copy of the License at
::
:: http://www.apache.org/licenses/LICENSE-2.0
::
:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS,
:: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
:: implied. See the License for the specific language governing
:: permissions and limitations under the License.
::
:: A copy of the license is available in the repository's
:: LICENSE file.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: VARIABLES                                                                    :
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

SETLOCAL
SET PROJECT_DIR=%cd%
::SET SCRIPTS_DIR=%~dp0\scripts
SET PROJECT_NAME={{cookiecutter.project_name}}
SET SUPPORT_LIBRARY={{ cookiecutter.support_library }}
SET ENV_NAME={{ cookiecutter.conda_environment_name }}

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: COMMANDS                                                                     :
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Jump to command
GOTO %1

:: Perform user variable setup
:::setup_user
::    ENDLOCAL & (
::        ECHO ^>^>^> running user_setup.py
::        CALL activate "%ENV_NAME%"
::        CALL python "%SCRIPTS_DIR%"\setup_user.py
::        ECHO ^>^>^> User setup complete
::    )
::    EXIT /B

:: Build the local environment from the environment file
:env
    ENDLOCAL & (
        :: Install MAMBA for faster solves
        CALL conda install -c conda-forge mamba yaml -y
        :: update environment with package dependencies
        CALL python check_package_deps.py
        :: Create new environment from environment file
        CALL mamba env create -f build_environment.yml
        :: Activate the environment so you can get to work
        CALL activate %ENV_NAME%
        :: Install the local package in development (experimental) mode
        CALL python -m pip install -e .
    )
    EXIT /B

:: Build the environment from the arc environment file
:env_arc
    ENDLOCAL & (
        :: Install MAMBA for faster solves
        CALL conda install -c conda-forge mamba yaml -y
        :: Create new environment from environment file
        CALL mamba env create -f environment_arc.yml
        :: Install the local package in development (experimental) mode
        CALL python -m pip install -e .
        :: Activate teh environment so you can get to work
        CALL activate %ENV_NAME_ARC%
    )
    EXIT /B

:: switch local packages to project branch
:switch_branches
    ENDLOCAL & (
        :: Switch local packages to project branch
        CALL python %SCRIPTS_DIR%\package_switcher.py
    )
    EXIT /B

:: Activate the environment
:env_activate
    ENDLOCAL & CALL activate %ENV_NAME%
    EXIT /B

:: Activate the environment
:env_activate_arc
    ENDLOCAL & CALL activate %ENV_NAME_ARC%
    EXIT /B

:: Remove the environment
:env_remove
	ENDLOCAL & (
		CALL conda deactivate
		CALL conda env remove --name %ENV_NAME% -y
	)
	EXIT /B

:: Remove the environment
:env_remove_arc
	ENDLOCAL & (
		CALL conda deactivate
		CALL conda env remove --name %ENV_NAME_ARC% -y
	)
	EXIT /B