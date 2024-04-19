Alternative program to run javaFX applications via. Java-DAP tool (see https://github.com/tblautenberg/Java-DAP)

To get this to work you need to have installed [VcXsrv](https://sourceforge.net/projects/vcxsrv/) on your host PC (for windows) or [Quartz](https://www.xquartz.org) (for MAC). For both you need to be sure that "Disable acsess controle" is winged off. Otherwise the program will not work as intended.

To build the image simply write "docker build -t jap ." inside of the dir. 

To run the container afterwards, write this command in the console "docker run -it --rm -e DISPLAY=host.docker.internal:0.0 jap"

This will start the container, build the target repo with maven, and forward the display via VcXsrv to your host PC.

Here is a bit of UML for the StartScript bash.

![Untitled Diagram drawio (2)](https://github.com/tblautenberg/JavaFX-DAP/assets/109878505/d72ff459-9e4e-43c2-8cc1-13ea8e525bf2)


Here is what happens in the docker container.


![Untitled Diagram drawio (3)](https://github.com/tblautenberg/JavaFX-DAP/assets/109878505/2b3563e6-679a-447f-b6d2-2938ffcf2c2d)
