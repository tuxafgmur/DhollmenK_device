# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2014 SlimRoms Project
# Copyright (C) 2014 Tuxafgmur - Dhollmen
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

## Specify phone tech before including full_phone
$(call inherit-product, vendor/dhollmen/config/gsm.mk)

# Device have its own init.rc
TARGET_PROVIDES_INIT_RC := true

# Release name
PRODUCT_RELEASE_NAME := p3100

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

# Inherit some common stuff.
$(call inherit-product, vendor/dhollmen/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/p3100/full_p3100.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p3100
PRODUCT_NAME := dhollmen_p3100
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P3100
PRODUCT_MANUFACTURER := Samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=espressorfxx \
    TARGET_DEVICE=espressorf \
    BUILD_FINGERPRINT="samsung/espressorfxx/espressorf:$(PLATFORM_VERSION)/$(BUILD_ID)/P3100XWALE2:user/release-keys" \
    PRIVATE_BUILD_DESC="espressorfxx-user $(PLATFORM_VERSION) $(BUILD_ID) P3100XWALE2 release-keys"
