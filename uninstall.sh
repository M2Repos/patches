#!/bin/sh

rootdirectory="$PWD"
dirs="device/mediatek/build device/mediatek/common device/mediatek/mt6735 frameworks/base kernel-3.18 vendor/mediatek/proprietary/custom vendor/mediatek/proprietary/hardware/liblights vendor/mediatek/proprietary/hardware/ril"

cd vendor/mediatek/kernel_modules/connectivity/wlan/adaptor
adapter_status=$(git diff)
cd $rootdirectory
cd vendor/mediatek/kernel_modules/connectivity/wlan/core/gen2
gen2_status=$(git diff)
cd $rootdirectory
if echo $adapter_status | grep -q wlan_if_changed && echo $gen2_status | grep -q wlan_if_changed; then
    dirs="$dirs vendor/mediatek/kernel_modules/connectivity/wlan/adaptor vendor/mediatek/kernel_modules/connectivity/wlan/core/gen2"
fi

for dir in $dirs ; do
    cd $rootdirectory
    cd $dir
    echo "Cleaning $dir patches..."
    git apply -R $rootdirectory/patches/$dir/*.patch
done

cd $rootdirectory
rm -r device/meizu
rm -r vendor/mediatek/proprietary/bootable/bootloader/preloader/custom/mblu2
rm -r vendor/mediatek/proprietary/modem
cd prebuilts/misc
git checkout linux-x86/flex/flex-2.5.39
cd $rootdirectory
echo "Done!"
