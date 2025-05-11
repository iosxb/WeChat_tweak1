export THEOS ?= /opt/theos
THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 2222
ARCHS = arm64 arm64e
TARGET = iphone:clang:14.5:14.0

TWEAK_NAME = wapleodtcorexpc
$(TWEAK_NAME)_FILES = $(wildcard src/*.m) src/Tweak.xm
$(TWEAK_NAME)_FRAMEWORKS = UIKit AVFoundation CoreLocation
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

$(info [DEBUG] THEOS path: $(THEOS))
$(info [DEBUG] Current working directory: $(CURDIR))

include $(THEOS)/makefiles/common.mk
include $(THEOS)/makefiles/tweak.mk

after-install::
	install.exec "killall -9 WeChat"