#!/bin/bash
otoid=$1
android_repo=/mnt/freenas/work

/usr/sbin/ntpdate cn.ntp.org.cn
cd $android_repo
/mnt/freenas/OTO/repo sync
source build/envsetup.sh
lunch android_x86_64-eng
make -j5 iso_img
mv out/target/product/x86_64/android_x86_64.iso out/target/product/x86_64/android_x86_64-$otoid-5.1.iso
