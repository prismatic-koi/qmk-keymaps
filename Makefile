# most of this copied from https://github.com/patrick-elmquist/qmk-keymaps
# I have left out the user folder for now

USER = prismatic-koi
KEYBOARDS = mode_envoy mokey_ginkgo65

# keyboard name
NAME_mode_envoy = mode/m256wh
NAME_mokey_ginkgo65 = mokey/ginkgo65hot

all: $(KEYBOARDS)

.PHONY: $(KEYBOARDS)
$(KEYBOARDS):
	# init submodule
	git submodule update --init --recursive

	# cleanup old symlinks
	rm -rf qmk_firmware/keyboards/mode/m256wh/keymaps/$(USER)
	rm -rf qmk_firmware/keyboards/mokey/ginkgo65hot/keymaps/$(USER)

	# add new symlinks
	ln -s $(shell pwd)/mode_envoy qmk_firmware/keyboards/mode/m256wh/keymaps/$(USER)
	ln -s $(shell pwd)/mokey_ginkgo65 qmk_firmware/keyboards/mokey/ginkgo65hot/keymaps/$(USER)

	# run lint check
	cd qmk_firmware; qmk lint -km $(USER) -kb $(NAME_$@)

	# run build
	make BUILD_DIR=$(shell pwd)/build -j1 -C qmk_firmware $(NAME_$@):$(USER)

	# cleanup symlinks
	rm -rf qmk_firmware/keyboards/mode/m256wh/keymaps/$(USER)
	rm -rf qmk_firmware/keyboards/mokey/ginkgo65hot/keymaps/$(USER)

clean:
	rm -rf qmk_firmware/keyboards/mode/m256wh/keymaps/$(USER)
	rm -rf qmk_firmware/keyboards/mokey/ginkgo65hot/keymaps/$(USER)
	rm -rf ./build/
	rm -rf ./qmk_firmware/
