## Psplash daemon snap

This snap contains the psplash binary run as a daemon to hide terminal consoles
on Ubuntu core devices if wanted.

It ships with the psplash-write untility to send messages to the screen from
scripts or the commandline.

There is also a service included that will print the login credentials on the 
splash screen.

**NOTE:** this snap has to run in devmode, there is no snapd interface providing direct
access to the framebuffer device with all additional bits (full tty0
ownership and sys_tty_config capability support) yet.

### Building

To build this snap natively on an armhf machine just call 

    snapcraft

If you are cross building on an amd64 system, make sure to first install the 
gcc-arm-linux-gnueabihf package and then call snapcraft.

    sudo apt install gcc-arm-linux-gnueabihf
    snapcraft

### Build time configuration

The tree ships a ./config file containing two variables.

    SPLASH="core_black-orange_st_hex.png"
    FONT="/usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-R.ttf"

To ship your own image place it in the toplevel of the tree and replace 
core_black-orange_st_hex.png in the config file with the name of your png.

Likewise you can put your own truetype font into the toplevel tree and add its name
to the config file (without full path) or, if the font is in an ubuntu package,
you can add the package name to the "build-packages" stanza in snapcraft.yaml and
define the full path to the ttf file in the config.

To disable the showing of the ssh command for remote logins, just remove the "showlogin" block
from the apps: section in snapcraft.yaml

    showlogin:
      command: showlogin.sh
      daemon: simple
      plugs: [network, network-bind]

### Runtime configuration

If you want to avoid any login consoles to take over your screen from psplash, add the option
    
    vt.handoff=2
 
to your kernel cmdline.
To quieten any u-boot messages on boot set the "stdout" variable to "serial" in the u-boot configuration.

    stdout=serial
