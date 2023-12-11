#---------------------------------------------------------------------------------------------
# Simple makefile for multitarget buil system
#
# Use: make [targets] [overrides]
# 
# Targets:
#		<FILE>.o - Builds <FILE>.o object file
#		build - Builds and links all source files
#		all - Same as build
#		clean - Removes all generated files
#
# Overrides:
#		CPU - ARM Cortex Architecture (cortex-m0plus, cortex-m4)
#		ARCH - ARM Architecture (arm, thumb)
#		SPECS - Specs file to give the linker (nosys.specs, nano.specs)
#---------------------------------------------------------------------------------------------

#.RECIPEPREFIX = >
VPATH = $(shell find $(SRC_DIR) -type d)

RM := rm -rf


# Main directories
SRC_DIR = ./src
DEBUG_DIR = ./bin/debug
RELEASE_DIR = ./bin/release
TEST_DIR = ./test


# Sources and objects
CPP_SRCS = $(shell find $(SRC_DIR) -type f -iname *.cpp)	# Find all app cpp
C_SRCS = $(shell find $(SRC_DIR) -type f -iname *.c)	# Find all app c

CPP_DEBUG_OBJS = $(patsubst %.cpp,$(DEBUG_DIR)/%.o,$(notdir $(CPP_SRCS)))
C_DEBUG_OBJS = $(patsubst %.c, $(DEBUG_DIR)/%.o, $(notdir $(C_SRCS)))

CPP_RELEASE_OBJS = $(patsubst $(DEBUG_DIR)%, $(RELEASE_DIR)%, $(CPP_DEBUG_OBJS))
C_RELEASE_OBJS = $(patsubst $(DEBUG_DIR)%, $(RELEASE_DIR)%, $(C_DEBUG_OBJS))


# Flags
COMMOMN_FLAGS = \
	-MD \
	-Wall \
	-pedantic \
	-I$(SRC_DIR)

CPP_FLAGS += \
	$(COMMOMN_FLAGS) \
	-std=c++11 \

C_FLAGS += \
	$(COMMOMN_FLAGS) \
	-std=c90 \

OPTIMIZATION    := -O0


ifeq ($(BUILD_MODE),CROSS)

  TOOLCHAIN_PREFIX = arm-none-eabi-
  BUILD_ARTIFACT_NAME = BUILD_STM32F407

  # Output files
  EXECUTABLE += \
	$(BUILD_ARTIFACT_NAME).elf

  MAP_FILE += \
	$(BUILD_ARTIFACT_NAME).map

  SIZE_OUTPUT += \
	$(BUILD_ARTIFACT_NAME).stdout

  OBJDUMP_LIST += \
	$(BUILD_ARTIFACT_NAME).list

  OBJCOPY_HEX += \
	$(BUILD_ARTIFACT_NAME).hex

  # Compiller specifications
  CXX = $(TOOLCHAIN_PREFIX)g++
  CC = $(TOOLCHAIN_PREFIX)gcc
  OBJDUMP = $(TOOLCHAIN_PREFIX)objdump
  OBJCOPY = $(TOOLCHAIN_PREFIX)objcopy
  OBJSIZE = $(TOOLCHAIN_PREFIX)size

else

  BUILD_ARTIFACT_NAME = Executable
  CXX = g++
  CC = gcc

endif


###########################################################
# Phony targets
###########################################################
.PHONY: all main-build dirs files clean test clean_test


all: main_build

main_build: $(DEBUG_DIR)/$(BUILD_ARTIFACT_NAME) $(RELEASE_DIR)/$(BUILD_ARTIFACT_NAME) | dirs #secundary-outputs

#######################################################################
# Debug target
#######################################################################
$(DEBUG_DIR)/$(BUILD_ARTIFACT_NAME): $(CPP_DEBUG_OBJS) $(C_DEBUG_OBJS)
	$(CXX) -g $^ -o $@ $(CPP_FLAGS)
ifeq ($(BUILD_MODE),CROSS)
	@echo "Recipe for debug cross compilation, not defined :("
endif

#############################################################################
# Release target
#############################################################################
$(RELEASE_DIR)/$(BUILD_ARTIFACT_NAME): $(CPP_RELEASE_OBJS) $(C_RELEASE_OBJS)
	$(CXX) $^ -o $@ $(CPP_FLAGS) $(OPTIMIZATION)
ifeq ($(BUILD_MODE),CROSS)
	@echo "Recipe for release cross compilation, not defined :("
endif

#################################################
# CPP targets
#################################################
$(DEBUG_DIR)/%.o: %.cpp | dirs
	$(CXX) -g $< -o $@ -c $(CPP_FLAGS)

$(RELEASE_DIR)/%.o: %.cpp | dirs
	$(CXX) $< -o $@ -c $(CPP_FLAGS) $(OPTIMIZATION)



#################################################
# C targets
#################################################
$(DEBUG_DIR)/%.o: %.c | dirs
	$(CC) -g $< -o $@ -c $(C_FLAGS)

$(RELEASE_DIR)/%.o: %.c | dirs
	$(CC) $< -o $@ -c $(C_FLAGS) $(OPTIMIZATION)

#################################################
# Include dependencies
#################################################
-include $(DEBUG_DIR)/*.d
-include $(RELEASE_DIR)/*.d

dirs:
	@mkdir -p  $(SRC_DIR)
	@mkdir -p  $(DEBUG_DIR)
	@mkdir -p  $(RELEASE_DIR)
# > @echo "Dirs created!"

files:
	@echo "CPP"
	@echo $(CPP_SRCS)
	@echo $(CPP_DEBUG_OBJS)
	@echo $(CPP_RELEASE_OBJS)
#- $(info $(CPP_APP_OBJS))
	@echo "C"
	@echo $(C_SRCS)
	@echo $(C_DEBUG_OBJS)
	@echo $(C_RELEASE_OBJS)

clean:
	@$(RM) $(DEBUG_DIR)/* $(RELEASE_DIR)/*
	@echo "Clean!"
#	@tree .

test:
	make -C $(TEST_DIR)

clean_test:
	make -C $(TEST_DIR) clean