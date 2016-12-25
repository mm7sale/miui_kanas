#
# Makefile for kanas
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI6_kanas.zip

# All apps from original ZIP, but has smali files chanded
local-modified-apps :=

local-modified-priv-apps := 

local-modified-jars := 

# All apks from MIUI
local-miui-removed-apps := 

local-miui-removed-priv-apps := 

local-miui-modified-apps := 

# All apps need to be removed from original ZIP file
local-remove-apps   := Gallery2 Exchange2

# Config density for co-developers to use the aaps with HDPI or XHDPI resource,
# Default configrations are HDPI for ics branch and XHDPI for jellybean branch
local-density := HDPI

PORT_PRODUCT := kanas

# To include the local targets before and after zip the final ZIP file, 
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
#local-pre-zip := local-pre-zip-misc
#local-after-zip:= local-put-to-phone

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions

#include phoneapps.mk

include $(PORT_BUILD)/porting.mk

local-pre-zip-misc:
	@echo Delete some unneeded files
	rm -rf $(ZIP_DIR)/system/etc/.has_su_daemon
	rm -rf $(ZIP_DIR)/system/priv-app/Dialer.apk
	rm -rf $(ZIP_DIR)/system/priv-app/Keyguard.apk
	rm -rf $(ZIP_DIR)/system/priv-app/SystemUI.apk
	rm -rf $(ZIP_DIR)/system/priv-app/VoiceDialer.apk
	rm -rf $(ZIP_DIR)/system/priv-app/ThemeChooser.apk
	rm -rf $(ZIP_DIR)/system/priv-app/ThemesProvider.apk
