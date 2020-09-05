TARGET := iphone:clang:latest:7.0

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Lingvo

Lingvo_FILES = Tweak.x
Lingvo_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
