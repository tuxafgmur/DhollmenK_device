# Copyright (C) 2012 The CyanogenMod Project
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

# Include omap4 common makefile
$(call inherit-product, device/samsung/omap4-common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

LOCAL_PATH := device/samsung

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/p3100/common-overlay \
    $(LOCAL_PATH)/tab2-common/common-overlay

PRODUCT_CHARACTERISTICS := tablet

# Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/p3100/rootdir/init.device.espresso.rc:root/init.device.espresso.rc \
    $(LOCAL_PATH)/tab2-common/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/tab2-common/rootdir/init.tab2.rc:root/init.espresso.rc \
    $(LOCAL_PATH)/tab2-common/rootdir/init.usb.tab2.rc:root/init.usb.espresso.rc \
    $(LOCAL_PATH)/tab2-common/rootdir/ueventd.tab2.rc:root/ueventd.espresso.rc \
    $(LOCAL_PATH)/tab2-common/rootdir/fstab.empty:root/fstab.espresso \
    $(LOCAL_PATH)/tab2-common/rootdir/busybox:root/sbin/busybox \
    $(LOCAL_PATH)/tab2-common/rootdir/fstab.sh:root/sbin/fstab.sh

# Recovery files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/p3100/rootdir/recovery/init.recovery.espresso.rc:root/init.recovery.espresso.rc \
    $(LOCAL_PATH)/tab2-common/rootdir/recovery/fstab_recovery.sh:recovery/root/sbin/fstab_recovery.sh \
    $(LOCAL_PATH)/tab2-common/rootdir/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tab2-common/configs/gps.xml:system/etc/gps.xml

# Media profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tab2-common/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/tab2-common/configs/media_profiles.xml:system/etc/media_profiles.xml

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tab2-common/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tab2-common/usr/keychars/espresso-gpio-keypad.kcm:system/usr/keychars/espresso-gpio-keypad.kcm \
    $(LOCAL_PATH)/tab2-common/usr/keychars/sec_keyboard.kcm:system/usr/keychars/sec_keyboard.kcm \
    $(LOCAL_PATH)/tab2-common/usr/keylayout/espresso-gpio-keypad.kl:system/usr/keylayout/espresso-gpio-keypad.kl \
    $(LOCAL_PATH)/tab2-common/usr/keylayout/sec_keyboard.kl:system/usr/keylayout/sec_keyboard.kl

# Packages
PRODUCT_PACKAGES += \
    audio.primary.piranha \
    audio.r_submix.default \
    camera.piranha \
    GalaxyTab2Settings \
    hwcomposer.piranha \
    lights.piranha \
    libinvensense_mpl \
    power.piranha

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Samsung dock keyboard
PRODUCT_PACKAGES += \
    dock_kbd_attach

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Wallpapers
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_01.jpg:system/media/wallpapers/wallpaper_01.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_01_small.jpg:system/media/wallpapers/wallpaper_01_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_02.jpg:system/media/wallpapers/wallpaper_02.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_02_small.jpg:system/media/wallpapers/wallpaper_02_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_03.jpg:system/media/wallpapers/wallpaper_03.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_03_small.jpg:system/media/wallpapers/wallpaper_03_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_04.jpg:system/media/wallpapers/wallpaper_04.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_04_small.jpg:system/media/wallpapers/wallpaper_04_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_05.jpg:system/media/wallpapers/wallpaper_05.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_05_small.jpg:system/media/wallpapers/wallpaper_05_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_06.jpg:system/media/wallpapers/wallpaper_06.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_06_small.jpg:system/media/wallpapers/wallpaper_06_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_07.jpg:system/media/wallpapers/wallpaper_07.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_07_small.jpg:system/media/wallpapers/wallpaper_07_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_08.jpg:system/media/wallpapers/wallpaper_08.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_08_small.jpg:system/media/wallpapers/wallpaper_08_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_09.jpg:system/media/wallpapers/wallpaper_09.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_09_small.jpg:system/media/wallpapers/wallpaper_09_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_10.jpg:system/media/wallpapers/wallpaper_10.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_10_small.jpg:system/media/wallpapers/wallpaper_10_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_11.jpg:system/media/wallpapers/wallpaper_11.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_11_small.jpg:system/media/wallpapers/wallpaper_11_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_12.jpg:system/media/wallpapers/wallpaper_12.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_12_small.jpg:system/media/wallpapers/wallpaper_12_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_13.jpg:system/media/wallpapers/wallpaper_13.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_13_small.jpg:system/media/wallpapers/wallpaper_13_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_14.jpg:system/media/wallpapers/wallpaper_14.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_14_small.jpg:system/media/wallpapers/wallpaper_14_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_15.jpg:system/media/wallpapers/wallpaper_15.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_15_small.jpg:system/media/wallpapers/wallpaper_15_small.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_16.jpg:system/media/wallpapers/wallpaper_16.jpg \
    $(LOCAL_PATH)/p3100/wallpapers/wallpaper_16_small.jpg:system/media/wallpapers/wallpaper_16_small.jpg

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
$(call inherit-product-if-exists, vendor/samsung/p31xx/p31xx-vendor.mk)
