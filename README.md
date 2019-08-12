# patches
1. [Download alps srcs (t-alps-release-p0.*.mt6737-39-6580)](https://cloud.mail.ru/public/GraX/wynwtx6WV)
2. Clone this repo in srcs folder
3. ./patches/install.sh ("./patches/install.sh wlan0" if you want modules with wlan0 as hotspot support) 
4. source build/envsetup.sh
5. lunch full_mblu2-userdebug
6. make otapackage 2>&1 | tee build.log
