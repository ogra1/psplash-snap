## Psplash daemon snap

This snap contains the poky psplash binary run as a daemon to hide terminal consoles
on Ubuntu core devices if wanted.

To ship your own image replace core_black-orange_st_hex.png with your own png,
adjust the make-image-header.sh call and the sed command in snapcraft.yaml and
rebuild the snap using snapcraft.
