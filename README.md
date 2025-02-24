# Ada Ravenscar Embedded Project using Micro:BitV2 RARTS
This project, baptized as Rage Against the Real-Time System, is an Ada Ravenscar hard real-time system for use in the course Intelligent Real-Time Systems at USN Kongsberg. In the project, the creators built a mecanum car, mounted ultrasonic sensors on it, then used a Micro:BitV2 as its controller. A second Micro:Bit can also be used as a remote control via radio link. To make the running of Ada source code possible on the Micro:Bit this project utilizes the Ada Drivers Library, the version of which we used can be found at https://github.com/aiunderstand/Ada_Drivers_Library.

The project consists of two independent GNAT Studio projects with different source code; "Mecanum Car" contains the source code that is to run on a micro:bit mounted on the actual mecanum-car, while "Remote Microbit" contains the code that is to run on a separate remote control Micro:Bit.

The creators are: Stian Nordholm and Anders Mørk Minde

To clone sucsessfully, remember the submodules:

`git clone --recurse-submodules https://github.com/aiunderstand/Ada-Embedded-Project-MicroBitV2.git`

This project was forked from the template for USN BSc intelligent real-time systems course:
https://github.com/aiunderstand/Ada-Embedded-Project-MicroBitV2.git


