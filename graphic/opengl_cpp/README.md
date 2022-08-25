# Dependecices 
## GLFW
GLFW could be installed from github and build by cmake if in the case of an arch linux operation system it could be downloaded from officale (community) repository


`sudo pacman -Sy glfw3`

## GLAD 
you can install it from https://glad.dav1d.de/
or clone it from the officale repository then :


`cd glad ;sudo cp -r include/glad /usr/include; cp src/glad.c $PATH_TO_YOUR_PROJECT`


after that don't forget to link glad.c and the main.cpp (very important)
## Link Library

you have to link to the following libaries:

`-lglfw -lX11 -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor`





============== Install Dependecies in Linux Ubuntu ==================
sudo apt update
sudo apt install build-essential
sudo apt install cmake
sudo apt install xorg-dev

download glfw source package https://www.glfw.org/download.html
unpack it in Desktop
go to unpacked directory

cmake -G "Unix Makefiles"
make
sudo make install

sudo apt-get install libx11-dev libglu1-mesa-dev freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libgl1-mesa-glx libgl1-mesa-dev libglfw3-dev libglfw3

make your own code and name it with extension .c
and then

f86c "source filename".c -o "filename" -Wall -lGL -lGLU -lglut -lGLEW -lglfw -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

also works with c++:

g++ "source filename".cpp -o "filename" -std=c++11 -Wall -lGL -lGLU -lglut -lGLEW -lglfw -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor


video in Youtube : https://www.youtube.com/watch?v=ZwaHQ6c-ma0
