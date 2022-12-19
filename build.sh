#!/usr/bin/bash
set -o errexit
set -o nounset
set -o pipefail

export ANDROID_SDK="${HOME}/Android/Sdk/build-tools/25.0.3"
export ANDROID_NDK="${HOME}/Android/Sdk/ndk/22.0.7026061"

# /home/liblaf/Android/Sdk/ndk/22.0.7026061/toolchains/llvm/prebuilt/linux-x86_64/lib64/clang/11.0.5/bin/asan_device_setup
mkdir --parents android/ijkplayer/ijkplayer-example/src/main/resources/lib/x86
cp /home/liblaf/Android/Sdk/ndk/22.0.7026061/wrap.sh/asan.sh android/ijkplayer/ijkplayer-example/src/main/resources/lib/x86/wrap.sh
mkdir --parents android/ijkplayer/ijkplayer-example/src/main/jniLibs/x86
cp /home/liblaf/Android/Sdk/ndk/22.0.7026061/toolchains/llvm/prebuilt/linux-x86_64/lib64/clang/11.0.5/lib/linux/libclang_rt.asan-i686-android.so android/ijkplayer/ijkplayer-example/src/main/jniLibs/x86/libclang_rt.asan-i686-android.so

cd config
rm --force module.sh
ln --symbolic module-lite.sh module.sh
cd ..

cd android/contrib
./compile-ffmpeg.sh clean
./compile-ffmpeg.sh "${@}"

cd ..
./compile-ijk.sh clean
./compile-ijk.sh "${@}"
