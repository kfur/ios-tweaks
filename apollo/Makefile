INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = apollo

apollo_FILES = Tweak.xm
apollo_CFLAGS = -fobjc-arc
apollo_FRAMEWORKS = UIKit StoreKit


include $(THEOS_MAKE_PATH)/tweak.mk
