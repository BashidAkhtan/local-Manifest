#!/bin/bash

# Initialize manifest
repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs --depth=1

# Remove if any previous clones

# repo sync
/opt/crave/resync.sh

# Miami-Trees
# Device
git clone https://github.com/Motorola-Miami/android_device_motorola_miami.git -b 15.0_Mist device/motorola/miami
# Device Common
git clone https://github.com/Motorola-Miami/android_device_motorola_sm6375-common.git -b rebase/15.0 device/motorola/sm6375-common
# Vendor 
git clone https://gitlab.com/motorola-miami/proprietary_vendor_motorola_miami.git -b rebase/15.0 vendor/motorola/miami
# Vendor Common
git clone https://github.com/Motorola-Miami/proprietary_vendor_motorola_sm6375-common.git --depth 1 -b rebase/15.0 vendor/motorola/sm6375-common
# Kernel
git clone https://github.com/Motorola-Miami/android_kernel_motorola_sm6375.git --depth 1 -b 15.0-KSU-Next kernel/motorola/sm6375
# Hardware 
git clone https://github.com/Motorola-Miami/android_hardware_motorola.git -b 15.0 hardware/motorola
# OTA Updater
rm -rf packages/apps/Updater
git clone https://github.com/Motorola-Miami/android_miami_packages_apps_Updater.git -b 15.0_crDroid packages/apps/Updater

# Build Signing
git clone https://github.com/BashidAkhtan/miami_build_signing.git vendor/

# set build environment
. build/envsetup.sh

# Start Building
brunch miami

