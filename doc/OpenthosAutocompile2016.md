# openthos自动编译
## 机器配置
使用Ubuntu 15.10 amd64版本

##翻墙
服务器使用lantern软件翻墙，输入以下命令配置翻墙代理  
```
export http_proxy=127.0.0.1:8787
export https_proxy=127.0.0.1:8787
```

##安装必要软件
参考[官方文档](http://source.android.com/source/initializing.html)，编译6.0需要openjdk8，然后安装repo

##从sf上取得6.0源码
```
mkdir android-repo
cd android-repo
repo init -u git://gitscm.sf.net/gitroot/android-x86/manifest -b marshmallow-x86 #6.0代号为marshmallow
repo sync
```

##开始编译
```
cd android-repo
source build/envsetup.sh
lunch android_x86_64-eng  #选择7 x86-64-eng 系统
make -j16 iso_img
```
编译完成之后，系统镜像位于out/target/product/x86/android_x86.iso
