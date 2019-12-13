#!/bin/bash

[ ! -d "$PWD/build" ] || [ ! -d "$PWD/device/mediatek" ] && echo "Incorrect folder" && exit 0

rootdirectory="$PWD"
dirs="device/mediatek/build
      device/mediatek/common
      device/mediatek/mt6735
      frameworks/base
      kernel-3.18
      vendor/mediatek/kernel_modules/connectivity/wlan/adaptor
      vendor/mediatek/kernel_modules/connectivity/wlan/core/gen2
      vendor/mediatek/proprietary/custom
      vendor/mediatek/proprietary/hardware/liblights
      vendor/mediatek/proprietary/hardware/ril"

for dir in $dirs ; do
    cd $rootdirectory
    cd $dir
    echo "Cleaning $dir patches..."
    git apply -R $rootdirectory/patches/$dir/*.patch
done

cd $rootdirectory
rm -r device/meizu
rm -r vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2
rm -r vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2x32
rm -r vendor/mediatek/proprietary/modem
cd prebuilts/misc
git checkout linux-x86/flex/flex-2.5.39
cd $rootdirectory
echo "Done!"
