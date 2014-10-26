GamifiedCityPlanning-MC1
========================

This is simple demo for gamified city planning. The open source game engine
is based on Minecraft-demo at https://github.com/fogleman/Minecraft, which is
written in Python and Pyglet (see http://www.youtube.com/watch?v=kC3lwK631X8)
We have supplemented the program with open data taken from the databases of
the Helsinki City Planning Department and the laser scanning data of the
National Land Survey of Finland. The used data sets have been pre-processed
using commonly available GIS-tools. For visualiation, we have also added
some R-code which works well for not too large point clouds.

For those interested in developing the visualization routines etc. further,
we would like to point out that there is a more advanced version available
which has been written in C using modern OpenGL, see
https://github.com/fogleman/Craft

Depending on what you have installed on your computer the installation of
the program should be easy: On Macs (with pre-installed python) simply
copy the contents of the directory GamifiedCityPlanning_MC1 on your computer
and then type
> python main.py

If there are any problems, follow the more detaled instruction below. If
everything works out, it will take a few seconds to initialize the virtual world
after which you can start playing.


How to Play
Moving

    W: forward
    S: back
    A: strafe left
    D: strafe right
    Mouse: look around
    Space: jump
    Tab: toggle flying mode

Building

    Selecting type of block to create:
        1: brick
        2: grass
        3: sand
    Mouse left-click: remove block
    Mouse right-click: create block

Quitting

    ESC: release mouse, then close window



How to Run

pip install pyglet
git clone https://github.com/fogleman/Minecraft.git
cd Minecraft
python main.py

Mac

On Mac OS X, you may have an issue with running Pyglet in 64-bit mode. Try running Python in 32-bit mode first:

arch -i386 python main.py

If that doesn't work, set Python to run in 32-bit mode by default:

defaults write com.apple.versioner.python Prefer-32-Bit -bool yes 

This assumes you are using the OS X default Python. Works on Lion 10.7 with the default Python 2.7, and may work on other versions too. Please raise an issue if not.

Or try Pyglet 1.2 alpha, which supports 64-bit mode:

pip install https://pyglet.googlecode.com/files/pyglet-1.2alpha1.tar.gz 

If you don't have pip or git

For pip:

    Mac or Linux: install with sudo easy_install pip (Mac or Linux) - or (Linux) find a package called something like 'python-pip' in your package manager.
    Windows: install Distribute then Pip using the linked .MSI installers.

For git:

    Mac: install Homebrew first, then brew install git.
    Windows or Linux: see Installing Git from the Pro Git book.
