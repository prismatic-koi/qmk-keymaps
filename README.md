# qmk keymaps and firmware for my keyboards

enter the devshell (provides qmk, make, git, python3, and the ARM/AVR
cross-compilers needed to build):

`nix develop`

commands (run from inside the devshell):
`make all`
`make mode_envoy`

## flashing

the keyboard being flashed is the one you type on, so once it enters DFU bootloader mode it can't press Enter. start the flash command first (it will poll waiting for the bootloader), then trigger the bootloader:

```
make mode_envoy
ln -sf "$PWD/mode_envoy" qmk_firmware/keyboards/mode/m256wh/keymaps/prismatic-koi
cd qmk_firmware && qmk flash -kb mode/m256wh -km prismatic-koi
```

command will say "Waiting for bootloader device..." — at this point, trigger QK_BOOT on the keyboard: hold MO(2) (bottom row) and tap the top-left key. the board re-enumerates as DFU and flashes.
