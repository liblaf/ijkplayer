#!/usr/bin/env bash
set -o errexit
set -o nounset

export ANDROID_SDK="${HOME}/Android/Sdk"
export ANDROID_NDK="${HOME}/.local/pkgs/ndk/r21e"
export NDK_LLVM_HOME="${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64"
ndk_llvm_config="${NDK_LLVM_HOME}/bin/llvm-config"
export LD_LIBRARY_PATH="$("${ndk_llvm_config}" --libdir)"
export LIB_MONITOR_HOME="${HOME}/Desktop/liblaf/lib-monitor"

bash "${LIB_MONITOR_HOME}/inserter/wrap-ndk.sh"

cd config
rm --force module.sh
ln --symbolic module-default.sh module.sh
cd ..

cd android/contrib
./compile-ffmpeg.sh clean
./compile-ffmpeg.sh "${@}"

cd ..
# export ANDROID_NDK="${HOME}/.local/pkgs/ndk/r14b"
./compile-ijk.sh clean
./compile-ijk.sh "${@}"
