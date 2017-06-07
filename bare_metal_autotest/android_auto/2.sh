#!/bin/bash -x


ip_android="192.168.2.21"



#read -p "please input the ip_android:" ip_android
####pause press anykey to continue
echo ${ip_android}


./adb connect ${ip_android}

./adb devices

sleep 3


#./adb install ./fndxn2_yoyou.com.apk
./adb  -s ${ip_android}:5555  install ./net.jishigou.t2.8.0.apk

sleep 3

./adb   -s ${ip_android}:5555  shell am start -n net.jishigou.t/net.jishigou.t.StartActivity

#./adb push  ./xxx/x   /x/x/x/
#./adb shell /x/x/x/x
#mkdir ./test_result
#./adb pull  ./xxx/*  ./test_result

#tar zcvf ./test_result ./test_result.tar.gz  #通过web下载测试用例。
#rm -rf ./test_result
sleep 10


###reboot to  linux
./android_fastboot.sh  ${ip_android}  reboot_bootloader


###reboot to android
#./android_fastboot.sh  ${ip_android}  bios_reboot
