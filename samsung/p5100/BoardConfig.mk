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

# Include p51xx BoardConfigCommon
-include device/samsung/p5100/BoardConfigCommon.mk

TARGET_BOARD_INFO_FILE := device/samsung/p5100/board-info.txt

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/samsung/espresso10
TARGET_KERNEL_CONFIG := dhollmen_P5100_defconfig
TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/p5100/rootdir/recovery/zImage

# assert
TARGET_OTA_ASSERT_DEVICE := p5100,GT-P5100,espresso10rf,espresso10rfxx
