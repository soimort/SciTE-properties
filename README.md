# Mort's SciTE editor configuration


* `new/` is where you make your own changes.
* `old/` is the "vanilla" (unmodified) SciTE properties.
* `patches/` stores the generated `.patch` files. It should NEVER be modified by a human.
* `properties/` stores the generated SciTE properties to be finally used. It should NEVER be modified by a human.


## Installation

    $ sudo pacman -S scite
    
    $ make install

This will copy the existing configuration in `properties/` to the system location.


## Update configuration

Copy the vanilla (unmodified) properties into `old/`.

Make your changes in `new/`. Then:

    $ make patches

This will generate some `.patch` files in `patches/`.

To install them to the system, execute:

    $ make upgrade


## Other commands

    $ ./extract_properties.sh scite-3.3.1-1-x86_64.pkg.tar.xz
    
This will extract the vanilla (unmodified) properties into `properties/`.

    $ ./patch_properties.sh

This will apply the patches in `patches/` on `properties/`.

    $ ./copy_properties.sh

The same as `make install`.
