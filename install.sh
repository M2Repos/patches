#!/bin/sh
rootdirectory="$PWD"
dirs="device frameworks/base kernel-3.18 vendor/mediatek/proprietary/custom vendor/mediatek/proprietary/hardware"

for dir in $dirs ; do
    cd $rootdirectory
    cd $dir
    echo "Applying $dir patches..."
    git apply $rootdirectory/patches/$dir/*.patch
done

cd $rootdirectory
cp -r patches/vendor/mediatek/libs/mblu2 vendor/mediatek/libs/mblu2
cp -r vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/k37tv1_64_bsp vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2
mv vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2/k37tv1_64_bsp.mk vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2/mblu2.mk
sed -i 's/TARGET=k37tv1_64_bsp/TARGET=mblu2/' vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2/mblu2.mk
echo "Done!"
