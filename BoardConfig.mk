#
# Copyright (C) 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/huawei/angler

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

# Second architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

TARGET_USES_AOSP := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8994
TARGET_BOOTLOADER_BOARD_NAME := angler
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# kernel
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=angler androidboot.console=ttyHSL0 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-3 no_console_suspend swiotlb=2048
BOARD_KERNEL_CMDLINE += loop.max_part=7 androidboot.selinux=permissive androidboot.boot_devices=soc.0/f9824900.sdhci
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
TARGET_KERNEL_SOURCE := kernel/huawei/angler
TARGET_KERNEL_CONFIG := lineageos_angler_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_NOT_USE_GZIP_RECOVERY_RAMDISK := true

# APEX
TARGET_FLATTEN_APEX := true

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_DSM_FEEDBACK := true
USE_XML_AUDIO_POLICY_CONF := 1

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_angler.txt

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_GRALLOC1_ADAPTER := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048
TARGET_USES_HWC2 := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U
TARGET_DISABLE_POSTRENDER_CLEANUP := true
VSYNC_EVENT_PHASE_OFFSET_NS := 2000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 6000000
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# HIDL
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
TARGET_FS_CONFIG_GEN += $(DEVICE_PATH)/config.fs

# IPA
TARGET_USES_NO_MTU_IPACM := true

#NFC
NXP_CHIP_TYPE := 2

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
# as of 3765811, inode usage was xxxx, use 4096 to be safe
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26503790080
BOARD_CACHEIMAGE_PARTITION_SIZE := 104857600
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VENDORIMAGE_PARTITION_SIZE := 209715200
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE    := squashfs
BOARD_VENDORIMAGE_JOURNAL_SIZE        := 0
BOARD_VENDORIMAGE_SQUASHFS_COMPRESSOR := lz4
TARGET_COPY_OUT_VENDOR := vendor

BOARD_USES_SECURE_SERVICES := true
TARGET_DISABLE_POSTRENDER_CLEANUP := true
BOARD_ROOT_EXTRA_FOLDERS := firmware persist
TARGET_USES_MKE2FS := true

# Power
TARGET_USES_INTERACTION_BOOST := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
TARGET_USES_NON_LEGACY_POWERHAL := true

# Recovery
TARGET_RECOVERY_UI_LIB := librecovery_ui_nanohub
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_RECOVERY_FSTAB = $(DEVICE_PATH)/rootdir/etc/fstab.angler

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SELINUX_IGNORE_NEVERALLOWS := true
SELINUX_IGNORE_NEVERALLOWS_ON_USER := true
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

# Shims
TARGET_LD_SHIM_LIBS := \
    /vendor/bin/ATFWD-daemon|libcutils_shim.so \
    /vendor/lib64/libcne.so|libcutils_shim.so \
    /vendor/lib64/libril-qc-qmi-1.so|libaudioclient_shim.so \


# Testing related defines
BOARD_PERFSETUP_SCRIPT := platform_testing/scripts/perf-setup/angler-setup.sh

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_AVOID_IFACE_RESET_MAC_CHANGE := true

-include vendor/huawei/angler/BoardConfigVendor.mk
