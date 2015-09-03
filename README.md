# My SciTE configuration

Here's the configuration for my second favorite editor.

## Features

### A dark theme for SciTE

![](https://cloud.githubusercontent.com/assets/342945/9662829/a5511888-5261-11e5-83dd-bee296ad7531.png)

### Highlighting support for more languages

* Haskell (enabled by default)
* Rust (enabled by default)
* Clojure
* Groovy
* Scala
* F#
* Agda
* Idris
* Markdown

### Misc improvements

* Use code page 65001 (**UTF-8**) by default.
* Use **LF** as end of line.
* Always use **monospaced** fonts.
* Always wrap long lines.
* Set indent size to **4**, with no tab. (except for editing Makefiles)
* Restore last session and window position.

## Requirements

* Operating system: *nix (SciTE properties are installed in `/usr/share/scite/`)
* Font: [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html)

## Installation

    $ make install

This will copy the existing configuration in `properties/` to the system location (`/usr/share/scite/`).

## Walkthrough

* `new/` is where you make your own changes.
* `old/` is the "vanilla" (unmodified) SciTE properties.
* `patches/` stores the generated `.patch` files. It should NEVER be modified by a human.
* `properties/` stores the generated SciTE properties to be finally used. It should NEVER be modified by a human.

### Update configuration

Copy the vanilla (unmodified) properties into `old/`.

Make your changes in `new/`. Then:

    $ make patches

This will generate some `.patch` files in `patches/`.

To install them to the system, execute:

    $ make upgrade

### Other commands

    $ ./extract_properties.sh scite-3.3.1-1-x86_64.pkg.tar.xz

This will extract the vanilla (unmodified) properties into `properties/`.

    $ ./patch_properties.sh

This will apply the patches in `patches/` on `properties/`.

    $ ./copy_properties.sh

The same as `make install`.
