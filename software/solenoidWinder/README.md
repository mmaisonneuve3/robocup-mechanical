### Solenoid Winder

These installation instructions assume you are using an Ubuntu 18.04 Operating System

1. Go to [this link](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/) and follow the esp install instructions.
    1. When connection to the ESP, the wires into the PCB go black, yellow, orange, with black on the same side as the black fin on the ESP.
    2. When flashing the ESP, make sure the boot jumper is connected
    3. After flashing the ESP, remove the boot jumper and power cycle the board, then the program should run when you open the monitor (step 10)
2. Go back to the esp directory ```cd ~/esp```
3. Create a new folder called solenoidWinder ```mkdir solenoidWinder```
4. Enter the new folder ```cd solenoidWinder```
5. Initialize an empty Git repo ```git init```
6. ```git config.sparseCheckout true```
7. ```git remote add -f origin https://github.com/RoboJackets/robocup-mechanical/tree/master```
    
2. Run the following commands to install Qt Creator
    
    > sudo apt-get install build-essential 
    
    > sudo apt-get install qtcreator
    
    > sudo apt-get install qt5-default
    
3. Open Qt Creator
