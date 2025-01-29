#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/Project-Mist-OS/manifest -b 15 --git-lfs --depth=1

# Clone local_manifests repository
curl https://raw.githubusercontent.com/BashidAkhtan/local-Manifest/refs/heads/15.0_miami/local_manifest_MistOS.xml > .repo/local_manifests.xml

# Sync the repositories
/opt/crave/resync.sh

export BUILD_USERNAME=Bashid
export BUILD_HOSTNAME=crave

#build
source build/envsetup.sh
mistify miami userdebug
m installclean
mist b
