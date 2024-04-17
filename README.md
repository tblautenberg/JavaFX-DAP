Alternative program to run javaFX applications via. Java-DAP tool.

To get this to work you need to have installed VcXsrv on your host PC (for windows) or https://www.xquartz.org (for MAC). For both you need to be sure that "Disable acsess controle" is winged off. Otherwise the program will not work as intended.

To build the image simply write "docker build -t jap ." inside of the dir. 

To run the container afterwards, write this command in the console "docker run -it --rm -e DISPLAY=host.docker.internal:0.0 jap"

This will start the container, build the target repo with maven, and forward the display via VcXsrv to your host PC.


