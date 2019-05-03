#!/bin/sh
rootdirectory="$PWD"
dirs="device frameworks/base kernel-3.18 vendor/mediatek/proprietary/custom vendor/mediatek/proprietary/hardware"

for dir in $dirs ; do
    cd $rootdirectory
    cd $dir
    echo "Cleaning $dir patches..."
    git apply -R $rootdirectory/patches/$dir/*.patch
done

cd $rootdirectory
rm -r vendor/mediatek/libs/mblu2
rm -r vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2
rm -r vendor/mediatek/proprietary/modem
echo "Done!"
