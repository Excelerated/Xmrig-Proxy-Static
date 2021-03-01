#!/bin/bash
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev wget
git clone https://github.com/xmrig/xmrig-proxy.git
git clone https://github.com/xmrig/xmrig.git
rm --force xmrig-proxy/cmake/flags.cmake
wget -O xmrig-proxy/cmake/flags.cmake https://raw.githubusercontent.com/Excelerated/Xmrig-Proxy-Static/main/cflags
cp -r xmrig/scripts xmrig-proxy/
mkdir xmrig-proxy/build
cd xmrig-proxy/scripts
./build_deps.sh
cd ../build
cmake .. -DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=on
make -j$(nproc)
ls
rm -r --force ../../xmrig
echo "Completed executable located at xmrig-proxy/build"
