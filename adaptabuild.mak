# ----------------------------------------------------------------------------
# CANopenNode makefile
# (c)2006-2023 by Ralph Hempel, Owen Sound, Canada
# rhempel@hempeldesigngroup.com
#
# This is designed to be included as part of a make system designed
# to be expandable and maintainable using techniques found in:
#
# Managing Projects with GNU Make - Robert Mecklenburg - ISBN 0-596-00610-1
# ----------------------------------------------------------------------------

MODULE := CANopenNode

MODULE_PATH := $(call make_current_module_path)
$(call log_debug,MODULE_PATH is $(MODULE_PATH))

$(MODULE)_PATH := $(MODULE_PATH)
$(call log_debug,$(MODULE)_PATH is $($(MODULE)_PATH))

# ----------------------------------------------------------------------------
# Source file lists go here, C dependencies are automatically generated
# by the compiler using the -m option
#
# You can set up a common source path late in the file
#
# Note that each module gets its own, privately scoped variable for building
# ----------------------------------------------------------------------------

# We need both else a previous definition is used :-) Can we make this an include?

SRC_C :=  
SRC_ASM :=  

SRC_C += CANopen.c

SRC_C += 301/CO_Emergency.c
SRC_C += 301/CO_fifo.c
SRC_C += 301/CO_HBconsumer.c
SRC_C += 301/CO_NMT_Heartbeat.c
SRC_C += 301/CO_Node_Guarding.c
SRC_C += 301/CO_ODinterface.c
SRC_C += 301/CO_PDO.c
SRC_C += 301/CO_SDOclient.c
SRC_C += 301/CO_SDOserver.c
SRC_C += 301/CO_SYNC.c
SRC_C += 301/CO_TIME.c
SRC_C += 301/crc16-ccitt.c

SRC_C += 303/CO_LEDs.c

SRC_C += 304/CO_SRDO.c
SRC_C += 304/CO_GFC.c

SRC_C += 305/CO_LSSmaster.c
SRC_C += 305/CO_LSSslave.c

SRC_C += 309/CO_gateway_ascii.c

SRC_C += extra/CO_trace.c

SRC_C += storage/CO_storage.c
# SRC_C += storage/CO_storageEeprom.c

# ----------------------------------------------------------------------------
# Set up the module level source and include paths

$(MODULE)_SRCPATH :=
$(MODULE)_SRCPATH += $(MODULE_PATH)
$(MODULE)_SRCPATH += $(MODULE_PATH)/301
$(MODULE)_SRCPATH += $(MODULE_PATH)/303
$(MODULE)_SRCPATH += $(MODULE_PATH)/304
$(MODULE)_SRCPATH += $(MODULE_PATH)/305
$(MODULE)_SRCPATH += $(MODULE_PATH)/309
$(MODULE)_SRCPATH += $(MODULE_PATH)/extra
$(MODULE)_SRCPATH += $(MODULE_PATH)/storage

# $(MODULE)_SRCPATH += $(MODULE_PATH)/ansi
# $(MODULE)_SRCPATH += $(MODULE_PATH)/math
# $(MODULE)_SRCPATH += $(MODULE_PATH)/mathf
# $(MODULE)_SRCPATH += $(MODULE_PATH)/stdio
# $(MODULE)_SRCPATH += $(MODULE_PATH)/misc

$(MODULE)_INCPATH :=
$(MODULE)_INCPATH += $(MODULE_PATH)

# ----------------------------------------------------------------------------
# NOTE: The default config file must be created somehow - it is normally
#       up to the developer to specify which defines are needed and how they
#       are to be configured.
#
# By convention we place config files in $(PRODUCT)/config/$(MCU) because
# that's an easy pace to leave things like HAL config, linker scripts etc

$(MODULE)_INCPATH += $(PRODUCT)/config/$(MCU)

# ----------------------------------------------------------------------------
# Set any module level compile time defaults here

$(MODULE)_CDEFS :=
# $(MODULE)_CDEFS += _SYSTEM

$(MODULE)_CFLAGS :=
# $(MODULE)_CFLAGS +=

# ----------------------------------------------------------------------------
# Include the adaptabuild library makefile - must be done for each module!

include $(ADAPTABUILD_PATH)/make/library.mak

# ----------------------------------------------------------------------------
