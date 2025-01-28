#!/bin/bash

rm -rf .repo/local_manifests/

# repo init
repo init -u https://github.com/Project-Flare/manifest -b 15 --depth=1 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
curl https://raw.githubusercontent.com/BashidAkhtan/local-Manifest/refs/heads/15.0_miami/local_manifest_Flare.xml > .repo/local_manifests.xml
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
lunch flare_miami-ap4a-userdebug
make installclean
make bacon