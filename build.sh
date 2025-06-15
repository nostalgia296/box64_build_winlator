git clone https://github.com/ptitSeb/box64
cd box64
mkdir buildNo32
cd buildNo32
cmake .. -DCMAKE_C_COMPILER=aarch64-linux-gnu-gcc -DARM64=1 -DWINLATOR_GLIBC=1 -DARM_DYNAREC=1 -DBAD_SIGNAL=1 -DCMAKE_BUILD_TYPE=Release
make -j
mkdir -p ./usr/local/bin
mv ./box64 ./usr/local/bin/
patchelf --set-interpreter /data/data/com.winlator/files/rootfs/lib/ld-linux-aarch64.so.1 ./usr/local/bin/box64
tar -cf ./box64_w10.tar ./usr/local/bin/box64
zstd -19 ./box64_w10.tar --rm
mv ./box64_w10.tar.zst ./box64_w10.whp
