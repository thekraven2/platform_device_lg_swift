#
# Copyright (C) 2009 The Android Open Source Project
#
# Copyright (C) 2011 Mike Gapinski
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

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES := \
    device/lg/swift/init.swift.rc:root/init.swift.rc 
    

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=160 \
    rild.libpath=/system/lib/libril-qc-1.so \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Default network type.
# 0 => WCDMA preferred.
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.telephony.default_network=0

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# This is a high density device with more memory, so larger vm heaps for it.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=24m


## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product, device/lg/swift-common/swift.mk)
## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
$(call inherit-product-if-exists, vendor/lg/swift/swift-vendor.mk)
