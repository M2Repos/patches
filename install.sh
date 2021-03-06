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
    echo "Applying $dir patches..."
    git apply $rootdirectory/patches/$dir/*.patch
done

cd $rootdirectory
cp -r patches/device/meizu device/.
cp -r vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/k37tv1_64_bsp vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2
cp -r vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/k37tv1_64_bsp vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2x32
mv vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2/k37tv1_64_bsp.mk vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2/mblu2.mk
mv vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2x32/k37tv1_64_bsp.mk vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2x32/mblu2x32.mk
sed -i 's/TARGET=k37tv1_64_bsp/TARGET=mblu2/' vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2/mblu2.mk
sed -i 's/TARGET=k37tv1_64_bsp/TARGET=mblu2x32/' vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2x32/mblu2x32.mk
cp -r patches/vendor/mediatek/proprietary/modem vendor/mediatek/proprietary/modem
cp patches/prebuilts/misc/linux-x86/flex/flex-2.5.39 prebuilts/misc/linux-x86/flex/flex-2.5.39
echo "Done!"
