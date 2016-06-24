# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Inherit device configuration

# Inherit device configuration

LOCAL := device/htc/primou

$(call inherit-product, device/htc/primou/full_primou.mk)

# Inherit common Omni configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=htc_primou \
	BUILD_FINGERPRINT="htc_wwe/htc_primou/primou:$(PLATFORM_VERSION)/$(BUILD_ID)/$(shell date +%Y%m%d%H%M%S):$(TARGET_BUILD_VARIANT)/test-keys" \
	PRIVATE_BUILD_DESC="htc_primou-$(TARGET_BUILD_VARIANT) $(PLATFORM_VERSION) $(BUILD_ID) $(shell date +%Y%m%d%H%M%S) test-keys"

# Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_primou
PRODUCT_GMS_CLIENTID_BASE := android-htc-rev

# Release name
PRODUCT_RELEASE_NAME := primou

DEVICE_PACKAGE_OVERLAYS += device/htc/primou/overlay

COMMON_PATH := device/htc/primou

# Boot ramdisk setup
PRODUCT_PACKAGES += init.target.rc

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/etc/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
	$(COMMON_PATH)/rootdir/system/etc/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
	$(COMMON_PATH)/rootdir/system/etc/AudioBTID.csv:system/etc/AudioBTID.csv \
	$(COMMON_PATH)/rootdir/system/etc/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv 

# Keylayouts and keychars
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
	$(COMMON_PATH)/rootdir/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
	$(COMMON_PATH)/rootdir/system/usr/keylayout/primou-keypad.kl:system/usr/keylayout/primou-keypad.kl \
	$(COMMON_PATH)/rootdir/system/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Input device config
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
	$(COMMON_PATH)/rootdir/system/usr/idc/primou-keypad.idc:system/usr/idc/primou-keypad.idc \
	$(COMMON_PATH)/rootdir/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc


# Call BCM4330 firmware
WIFI_BAND := 802_11_BG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)


# Lights / Sensors / GPS / Bluetooth
PRODUCT_PACKAGES += \
	lights.primou \
	sensors.primou \
	gps.primou \
	libbt-vendor

# Audio properties
PRODUCT_PROPERTY_OVERRIDES += \
	media.a1026.nsForVoiceRec=0 \
	media.a1026.enableA1026=1 \
	htc.audio.alt.enable=0 \
	htc.audio.hac.enable=1


# Density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US


# Disable ADB authentication and use root shell
#ADDITIONAL_DEFAULT_PROPERTIES += \
#    ro.adb.secure=0 \
#    ro.secure=0

# RECOVERY
PRODUCT_COPY_FILES += \
$(LOCAL)/rootdir/root/fstab.qcom:recovery/root/fstab.qcom \
$(LOCAL)/roordir/root/init.environ.rc:recovery/root/init.environ.rc \
$(LOCAL)/rootdir/root/init.qcom.power.rc:recovery/root/init.qcom.power.rc \
$(LOCAL)/roordir/root/init.qcom.rc:recovery/root/init.qcom.rc \
$(LOCAL)/rootdir/root/init.qcom.usb.rc:recovery/root/init.qcom.usb.rc \
$(LOCAL)/roordir/root/init.target.rc:recovery/root/init.target.rc \
$(LOCAL)/roordir/root/ueventd.qcom.rc:recovery/root/ueventd.qcom.rc 
