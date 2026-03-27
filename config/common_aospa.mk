#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

# Enable support for APEX updates
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# b/344511668
PRODUCT_PACKAGES += \
    android.software.credentials.prebuilt.xml

# Enable allowlist for some aosp packages that should not be scanned in a "stopped" state
# Some CTS test case failed after enabling feature config_stopSystemPackagesByDefault
PRODUCT_PACKAGES += initial-package-stopped-states-aosp.xml

# Audio
# Increase volume level steps
PRODUCT_SYSTEM_PROPERTIES += \
    ro.config.media_vol_steps=30

# Boot Animation
$(call inherit-product, vendor/aospa/bootanimation/bootanimation.mk)

# Camera
PRODUCT_PACKAGES += \
    Aperture

# curl
PRODUCT_PACKAGES += \
    curl

# Dex2oat
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true

# Dexpreopt
# Don't dexpreopt prebuilts. (For GMS).
DONT_DEXPREOPT_PREBUILTS := true

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    ParanoidSystemUI

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.systemuicompilerfilter=speed

# Display
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    debug.sf.frame_rate_multiple_threshold=60 \
    ro.surface_flinger.enable_frame_rate_override=false

# EGL - Blobcache configuration
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.egl.blobcache.multifile=true \
    ro.egl.blobcache.multifile_limit=33554432

# Exfat FS
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# Gestures
PRODUCT_PACKAGES += \
    vendor.aospa.power-service

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
     vendor/aospa/target/config/aospa_vendor_framework_compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

# Java Optimizations
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true

# MTE
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.arm64.memtag.system_server=off

# Navigation
PRODUCT_PRODUCT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# One Handed Mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Enable Sense service for 64-bit only
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=$(TARGET_SUPPORTS_64_BIT_APPS)

# Privapp-permissions
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.control_privapp_permissions?=log

# Protobuf - Workaround for prebuilt Qualcomm HAL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-vendorcompat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect_system \
    libqti_vndfwk_detect_vendor \
    libvndfwk_detect_jni.qti_system \
    libvndfwk_detect_jni.qti_vendor \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

# Qualcomm Common
$(call inherit-product, device/qcom/common/common.mk)

# Rescue Party
# Disable RescueParty due to high risk of data loss
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor

# StrictMode
ifneq ($(TARGET_BUILD_VARIANT),eng)
# Disable extra StrictMode features on all non-engineering builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.strictmode.disable=true
endif

# SEPolicy
$(call inherit-product, vendor/aospa/sepolicy/sepolicy.mk)

# Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client

PRODUCT_VENDOR_MOVE_ENABLED := true
