"""
This script is to replicate result.
Task Name : Poetry Exploration
Project : Cadence USA
Project Lead : Toral Mevada

This script is developed with python version 3.8

"""

def envchoice():
    env_1 = input("Please Choose Installation Type \n 1. Using Normal PIP \n 2. Poetry Setup : \n")
    return env_1

def scriptselect():
    if (tensorchoice == 'TF1.x' and temp == '1'):
        print('Script_1_1')
    elif (tensorchoice == 'TF1.x' and temp == '2'):
        print('Script_1_2')
    elif (tensorchoice == 'TF2.x' and temp == '1'):
        print('Script_2_1')
    else:
        print('Script_2_2')




#print("Hello, Welcome to the XNNC Setup Guide.\n")
#print("Please select Tensorflow version from below mentioned options.\n")
#print("Please select from TF1.x or TF2.x by typing it below...")

tensorchoice = input("Please select from TF1.x or TF2.x by typing it below : \n")

if tensorchoice == 'TF1.x':
    temp = envchoice()
    scriptselect()
elif tensorchoice == 'TF2.x':
    temp = envchoice()
    scriptselect()
    
