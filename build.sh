#!/usr/bin/bash
set -o errexit
set -o nounset
set -o pipefail

export ANDROID_SDK="${HOME}/Android/Sdk/build-tools/25.0.3"
export ANDROID_NDK="${HOME}/Android/Sdk/ndk/22.0.7026061"

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
