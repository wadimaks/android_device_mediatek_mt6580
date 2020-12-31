#
# Copyright (C) 2018-2019 The LineageOS Project
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit vendor blobs
$(call inherit-product-if-exists, vendor/doogee/x20/x20-vendor.mk)
### LINEAGE
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

LOCAL_PATH := device/doogee/x20

PRODUCT_CHARACTERISTICS := default

PRODUCT_NAME := lineage_x20
PRODUCT_DEVICE := x20

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_TAGS += dalvik.gc.type-precise

# Torch
PRODUCT_PACKAGES += \
    Torch

# STk
PRODUCT_PACKAGES += \
    Stk

PRODUCT_PACKAGES += \
   libxlog

# Lights
PRODUCT_PACKAGES += \
    lights.mt6580

# Browser
PRODUCT_PACKAGES += \
    Gello

# Messaging
PRODUCT_PACKAGES += \
    messaging

# Audio
PRODUCT_PACKAGES += \
    audio_policy.default \
    audio_policy.stub \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix \
    libtinyalsa
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default
PRODUCT_PACKAGES += \
    libbt-vendor
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bt_did.conf:system/etc/bluetooth/bt_did.conf

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/rootdir/fstab.mt6580:root/fstab.mt6580 \
    $(LOCAL_PATH)/rootdir/init.aee.rc:root/init.aee.rc \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.mt6580.rc:root/init.mt6580.rc \
    $(LOCAL_PATH)/rootdir/init.mt6580.usb.rc:root/init.mt6580.usb.rc \
    $(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/rootdir/init.xlog.rc:root/init.xlog.rc \
    $(LOCAL_PATH)/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
    $(LOCAL_PATH)/rootdir/meta_init.project.rc:root/meta_init.project.rc \
    $(LOCAL_PATH)/rootdir/meta_init.rc:root/meta_init.rc \
    $(LOCAL_PATH)/rootdir/init.performance.rc:root/init.performance.rc \
    $(LOCAL_PATH)/rootdir/init.nvdata.rc:root/init.nvdata.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6580.rc:root/ueventd.mt6580.rc \
    $(LOCAL_PATH)/rootdir/ueventd.rc:root/ueventd.rc

# Telecom
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml \
    $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/thermal/.ht120.mtc:system/etc/.tp/.ht120.mtc \
     $(LOCAL_PATH)/configs/thermal/thermal.conf:system/etc/.tp/thermal.conf \
     $(LOCAL_PATH)/configs/thermal/thermal.off.conf:system/etc/.tp/thermal.off.conf \
     $(LOCAL_PATH)/configs/thermal/.thermal_policy_00:system/etc/.tp/.thermal_policy_00

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    $(LOCAL_PATH)/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml
# Permissions overrides
PRODUCT_COPY_FILES_OVERRIDES += \
    system/etc/permissions/android.hardware.camera.xml

# Media codecs overrides
PRODUCT_COPY_FILES_OVERRIDES += \
    system/etc/media_codecs_google_video.xml

# Keyboard layout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
     $(LOCAL_PATH)/configs/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
     $(LOCAL_PATH)/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx \
    wifi_hal \
    libwpa_client \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    libnl_2 \
    libtinyxml

# Camera
PRODUCT_PACKAGES += \
    Snap

# FMRadio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmcust \
    libfmjni \
    libfmmt6620 \
    libfmmt6627 \
    libfmmt6628 \
    libfmmt6630 \
    libmtkplayer

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \

PRODUCT_PACKAGES += \
    gps.mt6580 \
    YGPS

# Sensor Calibration
PRODUCT_PACKAGES += libem_sensor_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    ro.zygote=zygote64_32 \
    camera.disable_zsl_mode=1 \
    ro.mount.fs=EXT4 \
    persist.service.acm.enable=0 \
    persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril.config=fakeiccid  \
    persist.call_recording.enabled=true \
    persist.call_recording.src=1 \
    persist.debug.wfd.enable=1

# Set default player to AwesomePlayer
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.use-awesome=true

#$(call inherit-product, build/target/product/full.mk)

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Remove unwanted files
PRODUCT_COPY_FILES_OVERRIDES += \
    root/fstab.goldfish \
    root/fstab.ranchu \
    root/init.goldfish.rc \
    root/init.ranchu.rc \
    root/ueventd.goldfish.rc \
    root/ueventd.ranchu.rc \
    recovery/root/fstab.goldfish \
    recovery/root/fstab.ranchu \
    recovery/root/ueventd.goldfish.rc \
    recovery/root/ueventd.ranchu.rc

# Remove unwanted packages
PRODUCT_PACKAGES_OVERRIDES += \
    audio.primary.goldfish \
    camera.goldfish.jpeg \
    camera.goldfish \
    fingerprint.goldfish \
    fingerprint.ranchu \
    gps.goldfish \
    lights.goldfish \
    power.goldfish \
    ResurrectionOTA \
    ResurrectionStats \
    sensors.goldfish \
    sensors.ranchu \
    vibrator.goldfish

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

# Dalvik
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
