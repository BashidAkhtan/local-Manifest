#!/bin/bash

rm -rf .repo/local_manifests/

# repo init
repo init -u https://github.com/Project-Mist-OS/manifest -b 15 --git-lfs --depth=1
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
curl https://raw.githubusercontent.com/BashidAkhtan/local-Manifest/refs/heads/15.0_miami/local_manifest_MistOS.xml > .repo/local_manifests.xml
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
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
mistify miami userdebug
mist b
