#!/bin/bash

rm -rf .repo/local_manifests/

# repo init
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 15 -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
curl https://raw.githubusercontent.com/BashidAkhtan/local-Manifest/refs/heads/15.0_miami/local_manifest_InfinityX.xml > .repo/local_manifests.xml
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh && repo sync --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=BashidAkhtan
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== EnvSetup Done ======="

# lunch 
lunch infinity_miami-userdebug
make installclean
mka bacon