SIMULATE ?= yes

ifeq ($(SIMULATE), yes)

CC := Clang
CFLAGS += -arch i386
CFLAGS += -Wno-import -Werror
#CFLAGS += -pipe -std=c99
#CFLAGS += -O0
#CFLAGS += -Wreturn-type -Wunused-variable
#CFLAGS += -Wno-trigraphs
#CFLAGS += -fpascal-strings -fasm-blocks
#CFLAGS += -fexceptions -fvisibility=hidden
#CFLAGS += -fmessage-length=0
#CFLAGS += -gdwarf-2
CFLAGS += -fobjc-abi-version=2
CFLAGS += -fobjc-legacy-dispatch
CFLAGS += -mmacosx-version-min=10.6
CFLAGS += -D__IPHONE_OS_VERSION_MIN_REQUIRED=40100
CFLAGS += -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.1.sdk
LDFLAGS += -Xlinker -objc_abi_version -Xlinker 2
LDFLAGS += -lobjc
LDFLAGS += -framework Foundation -framework UIKit -framework CoreGraphics

else

CC := Clang
CFLAGS += -Wno-import -Werror
CFLAGS += -arch armv6 -mthumb 
CFLAGS += -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk

endif

CODESIGN_ALLOCATE = /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/codesign_allocate

GEN_UUID := EA72E90C-C91B-11DF-8FC4-539D12B3A9FF
## $(uuid | tr '[:lower:]' '[:upper:]')

TARGET := test
OBJS := \
	Controll.o\
	AppDelegate.o \
	main.o

default: AppBundle
all: AppBundle

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.m
	$(CC) $(CFLAGS) -c -o $@ $<

clean: 
	rm -rf *.o $(TARGET) $(TARGET).app

AppBundle: code-sign
	mkdir -p $(TARGET).app
	cp Info.plist $(TARGET).app/
	touch $(TARGET).app/PkgInfo
	cp $(TARGET) $(TARGET).app/

code-sign: $(TARGET)
#	codesign -f -s "iPhone Developer" $(TARGET)

install2sim: AppBundle
	mkdir -p ~/Library/Application\ Support/iPhone\ Simulator/6.1/Applications/$(GEN_UUID)
	cp -rf $(TARGET).app ~/Library/Application\ Support/iPhone\ Simulator/6.1/Applications/$(GEN_UUID)/


kill_simulator:
	pkill "Simulator"

simulator: install2sim
	open -a "iPhone Simulator"

simulator_location = /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app/Contents/MacOS/iPhone\ Simulator
compiled_app = /Users/mac/Workspace/Stargaze/Stargaze/test.app/test

init:
	open -a "iPhone Simulator"

run: 
	$(simulator_location) -SimulateApplication $(compiled_app)

debug: kill_simulator install2sim AppBundle run

alt_debug: kill_simulator simulator
