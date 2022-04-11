#!/bin/bash

#######################################################################
# Function Defination 
test_python()
{
    pyversion=$(python3 -V 2>&1 | grep -Po '(?=Python)(.+)')
    if [[ -z "$pyversion" ]]
    then
        sudo apt install python3.8
        echo Successfully installed Python Version : \"$pyversion\"
    else
        echo Your current Python version is \"$pyversion\".
        echo Moving forward to Virtual Environment Setup.
    fi
}

create_venv()
{
    echo Please Enter Virtual Environment name : 
    read venvname

    echo Virtual Environment with name \"$venvname\" will be created.

    python3 -m venv $venvname
    source ./$venvname/bin/activate
    echo Virtual Environment \"$venvname\" is created successfully and is active.

}
######################################################################


######################################################################
# Greetings
echo Welcome to Normal PIP supported setup for TF1.x Version
echo Please follow guided choice and selection to complete installation.
######################################################################

###SCRIPT FOR FULL SETUP##############################################

#Python Testing and Installation
test_python

# Virtual Environment Setup
create_venv
# Installing Wheels to Virtual Environment




#####################################################################



