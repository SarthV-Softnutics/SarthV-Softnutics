#!/bin/bash

#######################################################################
# Function Defination 
test_python()
{
    pyversion=$(python3 -V 2>&1 | grep -Po '(?=Python)(.+)')
    #pyversion=''
    py=3.8

    if [[ -z "$pyversion" ]]
    then
        echo We have detected that your system is not having Python.
        echo Please procced to install Python and insert password if asked.
        sudo apt install python$py
        echo Successfully installed Python Version : \"$py\"
    else
        echo We have detected python version available in your system.
        echo Your current Python version is \"$pyversion\", which is compatible to our application.
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

install_wheels()
{
    
    var1=1
    

    echo Welcome to Environment Setup
    echo Please select you preferred Tensorflow Version from below listed choice to proceed with installation.
    echo 1. TF1.x
    echo 2. TF2.x
    echo Please enter your selection as \"1\" or \"2\" :
    read wheel_ver
    

    if [[ $wheel_ver -eq $var1 ]]
    then
        echo You have selected \"TF1.x\".
        echo Installing \"TF1.x\"......
        pip install wheels/xnncpkg-0.1.0-py3-none-any.whl
        #ADDITIONAL PACKAGE INSTALLATION HERE
        echo \"TF1.x\" Installation Complete.
    else
        echo You have selected \"TF2.x\".
    fi

}

cuda_check()
{
    #echo Support for CUDA check will be available in next versions.
    #CUDA CODE HERE
    echo Welcome to CUDA installation.
    echo CUDA will be installed in directory named : \"cuda_xnnc\".
    mkdir cuda_xnnc && cd cuda_xnnc

    #Getting ".pin" file
    echo Downloading CUDA-Ubuntu \".pin \" file.
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600

    #CUDA Download
    echo Downloading CUDA for Ubuntu 20.04
    wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb

    #Installing CUDA package
    echo Installing CUDA 11 Package for Ubuntu 20.04
    sudo dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb

    #Software Authetication
    echo Authenticating Package by installing keys.
    sudo apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub

    #Install CUDA
    sudo apt-get update
    sudo apt-get install cuda



}
######################################################################


######################################################################
# Greetings
echo Welcome to "XNNC" Environment Setup Guide.
echo Please follow guided choice and selection to complete installation.
######################################################################

###SCRIPT FOR FULL SETUP##############################################

#Python Testing and Installation
test_python

# Virtual Environment Setup
create_venv
# Installing Wheels to Virtual Environment
install_wheels

#Verifying CUDA Support
cuda_check




#####################################################################
