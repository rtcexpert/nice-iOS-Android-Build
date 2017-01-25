LOCAL_PATH  := $(call my-dir)

PRECOMPILED_LIB := $(LOCAL_PATH)/../../Android-Precompiled/lib
PRECOMPILED_INCLUDE := $(LOCAL_PATH)/../../Android-Precompiled/include
LIBNICE_PATH := $(LOCAL_PATH)/../../src
AGENT_PATH := $(LIBNICE_PATH)/agent
SOCKET_PATH := $(LIBNICE_PATH)/socket
RANDOM_PATH := $(LIBNICE_PATH)/random
STUN_PATH := $(LIBNICE_PATH)/stun

# glib
include $(CLEAR_VARS)
LOCAL_MODULE    := glib
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libglib-2.0.so
LOCAL_STATIC_LIBRARIES := intl iconv
include $(PREBUILT_SHARED_LIBRARY)

# gobject
include $(CLEAR_VARS)
LOCAL_MODULE    := gobject
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libgobject-2.0.so
LOCAL_STATIC_LIBRARIES := glib
include $(PREBUILT_SHARED_LIBRARY)

# gmodule
include $(CLEAR_VARS)
LOCAL_MODULE    := gmodule
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libgmodule-2.0.so
LOCAL_STATIC_LIBRARIES := glib
include $(PREBUILT_SHARED_LIBRARY)

# gthread
include $(CLEAR_VARS)
LOCAL_MODULE    := gthread
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libgthread-2.0.so
LOCAL_STATIC_LIBRARIES := glib
include $(PREBUILT_SHARED_LIBRARY)

# gio
include $(CLEAR_VARS)
LOCAL_MODULE := gio
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libgio-2.0.so
LOCAL_STATIC_LIBRARIES := glib
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE    := iconv
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libiconv.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := intl
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libintl.a
include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE    := z
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libz.so
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE    := ffi
LOCAL_SRC_FILES := $(PRECOMPILED_LIB)/libffi.a
LOCAL_STATIC_LIBRARIES := glib
include $(PREBUILT_STATIC_LIBRARY)

ENABLE_BUILD_SHARED := true

include $(CLEAR_VARS)
NICE                    := libnice-0.1.13
LOCAL_MODULE := libnice
LOCAL_LDLIBS            := -llog


LOCAL_SRC_FILES :=  \
$(AGENT_PATH)/address.c \
$(AGENT_PATH)/agent.c \
$(AGENT_PATH)/candidate.c \
$(AGENT_PATH)/component.c \
$(AGENT_PATH)/conncheck.c \
$(AGENT_PATH)/debug.c \
$(AGENT_PATH)/discovery.c \
$(AGENT_PATH)/inputstream.c \
$(AGENT_PATH)/interfaces.c \
$(AGENT_PATH)/iostream.c \
$(AGENT_PATH)/outputstream.c \
$(AGENT_PATH)/pseudotcp.c \
$(AGENT_PATH)/stream.c \
$(SOCKET_PATH)/http.c \
$(SOCKET_PATH)/pseudossl.c \
$(SOCKET_PATH)/socket.c \
$(SOCKET_PATH)/socks5.c \
$(SOCKET_PATH)/tcp-active.c \
$(SOCKET_PATH)/tcp-bsd.c \
$(SOCKET_PATH)/tcp-passive.c \
$(SOCKET_PATH)/udp-bsd.c \
$(SOCKET_PATH)/udp-turn-over-tcp.c \
$(SOCKET_PATH)/udp-turn.c \
$(RANDOM_PATH)/random-glib.c \
$(RANDOM_PATH)/random.c \
$(RANDOM_PATH)/test.c \
$(STUN_PATH)/debug.c \
$(STUN_PATH)/md5.c \
$(STUN_PATH)/rand.c \
$(STUN_PATH)/sha1.c \
$(STUN_PATH)/stun5389.c \
$(STUN_PATH)/stunagent.c \
$(STUN_PATH)/stuncrc32.c \
$(STUN_PATH)/stunhmac.c \
$(STUN_PATH)/stunmessage.c \
$(STUN_PATH)/utils.c \
$(STUN_PATH)/usages/bind.c \
$(STUN_PATH)/usages/ice.c \
$(STUN_PATH)/usages/timer.c \
$(STUN_PATH)/usages/turn.c \



LOCAL_STATIC_LIBRARIES  := glib iconv intl gio gthread gmodule gobject z ffi
LOCAL_CFLAGS            += -std=c99

NICE_DIRS               :=  $(PRECOMPILED_INCLUDE)/ \
                            $(LIBNICE_PATH)/ \
                            $(LIBNICE_PATH)/agent/ \
                            $(LIBNICE_PATH)/nice/ \
                            $(LIBNICE_PATH)/random/ \
                            $(LIBNICE_PATH)/socket/ \
                            $(LIBNICE_PATH)/stun/ \
                            $(LIBNICE_PATH)/stun/usages/


LIBGSTREAMER_INCLUDE    := $(PRECOMPILED_INCLUDE)/

LOCAL_CFLAGS +=  -DHAVE_NETDB_H -DDEBUG

NICE_INCLUDES           := $(NICE_DIRS)

LOCAL_C_INCLUDES        := $(NICE_INCLUDES) $(LIBGSTREAMER_INCLUDE) #add your own headers if needed


ifeq ($(ENABLE_BUILD_SHARED), true)
include $(BUILD_SHARED_LIBRARY)
endif
