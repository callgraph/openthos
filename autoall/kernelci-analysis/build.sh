#!/bin/bash
otoid=$1

cd `dirname $0`
start=$(date "+%s")
./compile.sh $otoid > /mnt/freenas/result/compile-$otoid 2>&1
now=$(date "+%s")
time=$((now-start))
echo "compile time:$time s"
/home/aquan/cts/cts-autotest/remoteTest.sh /mnt/freenas/work/out/target/product/x86_64/android_x86_64-$otoid-5.1.iso > /mnt/freenas/result/reallog 2>&1 &
/home/aquan/cts/cts-autotest/autoTest.sh v localhost /mnt/freenas/android-x86.raw installTest /mnt/freenas/work/out/target/product/x86_64/android_x86_64-$otoid-5.1.iso "--plan CTS --disable-reboot" > /mnt/freenas/result/virtuallog 2>&1
now1=$(date "+%s")
time=$((now1-now))
echo "deploy time:$time s"
./test.sh
now=$(date "+%s")
time=$((now-now1))
num=3
echo "exec $num testcases"
echo "test time:$time s"
