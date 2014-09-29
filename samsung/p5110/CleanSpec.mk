# Copyright (C) 2007 The Android Open Source Project
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

# ************************************************
# NEWER CLEAN STEPS MUST BE AT THE END OF THE LIST
# ************************************************

$(call add-clean-step, find $(PRODUCT_OUT) -name "*.apk" | xargs rm)
$(call add-clean-step, rm -rf $(TARGET_OUT)/build.prop)
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/p5110/obj/SHARED_LIBRARIES/libaudio_intermediates)
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/p5110/obj/STATIC_LIBRARIES/libasound_intermediates)
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/p5110/obj/EXECUTABLES/alsa_*)
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/p5110/system/bin/alsa_*)
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/p5110/system/etc/asound.conf)
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/p5110/system/usr/share/alsa)
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/p5110/obj/PACKAGING/systemimage_intermediates)
