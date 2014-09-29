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

# Device have its own init.rc
TARGET_PROVIDES_INIT_RC := true

# Release name
PRODUCT_RELEASE_NAME := p5110

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Inherit some common stuff.
$(call inherit-product, vendor/dhollmen/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/p5110/full_p5110.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p5110
PRODUCT_NAME := dhollmen_p5110
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P5110
PRODUCT_MANUFACTURER := Samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=espresso10wifixx \
    TARGET_DEVICE=espresso10wifi \
    BUILD_FINGERPRINT="samsung/espresso10wifixx/espresso10wifi:$(PLATFORM_VERSION)/$(BUILD_ID)/P5110XWALD2:user/release-keys" \
    PRIVATE_BUILD_DESC="espresso10wifixx-user $(PLATFORM_VERSION) $(BUILD_ID) P5110XWALD2 release-keys"
