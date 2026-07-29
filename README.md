# qmk keymaps and firmware for my keyboards

enter the devshell (provides qmk, make, git, python3, and the ARM/AVR
cross-compilers needed to build):

`nix develop`

commands (run from inside the devshell):
`make all`
`make mode_envoy`

then flash using something like
`qmk flash -kb mode/m256wh -km prismatic-koi build/mode_m256wh_prismatic-koi.bin`
