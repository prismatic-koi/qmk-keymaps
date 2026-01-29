# qmk keymaps and firmware for my keyboards

commands:
`make all`
`make mode_envoy`
`make mokey_ginkgo65`

set up qmk (assuming you have it installed)
`qmk setup -H qmk_firmware`

then flash using something like
`qmk flash -kb mode/m256wh -km prismatic-koi build/mode_m256wh_prismatic-koi.bin`
