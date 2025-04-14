git clone https://github.com/ptitSeb/box64
cd box64
mkdir build
cd build
cmake .. -DCMAKE_C_COMPILER=aarch64-linux-gnu-gcc -DARM64=1 -DWINLATOR_GLIBC=1 -DARM_DYNAREC=1 -DBAD_SIGNAL=1 -DCMAKE_BUILD_TYPE=Release -DBOX32=1
make -j
mkdir -p ./usr/local/bin
mv ./box64 ./usr/local/bin/
tar -cf ./box64_wp_box32.tar ./usr/local/bin/box64
zstd -z ./box64_wp_box32.tar
mv ./box64_wp_box32.tar.zst ./box64_wp_box32.tzst
patchelf --set-interpreter /data/data/com.winlator/files/rootfs/lib/ld-linux-aarch64.so.1 ./usr/local/bin/box64
tar -cf ./box64_w10_box32.tar ./usr/local/bin/box64
zstd -z ./box64_w10_box32.tar
mv ./box64_w10_box32.tar.zst ./box64_w10_box32.tzst
cd ..
mkdir buildNo32
cd buildNo32
cmake .. -DCMAKE_C_COMPILER=aarch64-linux-gnu-gcc -DARM64=1 -DWINLATOR_GLIBC=1 -DARM_DYNAREC=1 -DBAD_SIGNAL=1 -DCMAKE_BUILD_TYPE=Release
make -j
mkdir -p ./usr/local/bin
mv ./box64 ./usr/local/bin/
tar -cf ./box64_wp.tar ./usr/local/bin/box64
zstd -z ./box64_wp.tar
mv ./box64_wp.tar.zst ./box64_wp.tzst
patchelf --set-interpreter /data/data/com.winlator/files/rootfs/lib/ld-linux-aarch64.so.1 ./usr/local/bin/box64
tar -cf ./box64_w10.tar ./usr/local/bin/box64
zstd -z ./box64_w10.tar
mv ./box64_w10.tar.zst ./box64_w10.tzst
