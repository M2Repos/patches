# patches
1. [Download alps srcs (t-alps-release-p0.*.mt6737-39-6580)](https://cloud.mail.ru/public/GraX/wynwtx6WV)
2. Clone this repo in srcs folder
3. ./patches/install.sh
4. source build/envsetup.sh
5. lunch full_mblu2-userdebug (or "lunch full_mblu2x32-userdebug" for 32bit version)
6. make otapackage 2>&1 | tee build.log
