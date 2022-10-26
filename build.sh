#!/usr/bin/env bash
set -o errexit
set -o nounset

export ANDROID_SDK="${HOME}/Android/Sdk/build-tools/25.0.3"
export ANDROID_NDK="${HOME}/Android/Sdk/ndk/22.0.7026061"

cd config
rm --force module.sh
ln --symbolic module-default.sh module.sh
cd ..

cd android/contrib
./compile-ffmpeg.sh clean
./compile-ffmpeg.sh "${@}"

cd ..
./compile-ijk.sh clean
./compile-ijk.sh "${@}"
