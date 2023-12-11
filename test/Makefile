

#---------
#
# CppUTest Makefile
#
#----------

#Set this to @ to keep the makefile quiet
ifndef SILENCE
	SILENCE = @
endif

#--- Inputs ----#
# Name of component under test
COMPONENT_NAME = Tester

CPPUTEST_EXE_FLAGS = -c -v

MAKEFILE_DIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PROJECT_DIR = $(MAKEFILE_DIR)/..
CPPUTEST_HOME = $(PROJECT_DIR)/external/cpputest

CPPUTEST_USE_EXTENSIONS = Y
CPP_PLATFORM = Gcc

SRC_APP = $(PROJECT_DIR)/src/learn_unit_test
SRC_DIRS = $(shell find $(SRC_APP) -type d ! -path $(SRC_APP))

TEST_SRC_DIRS = $(shell find $(PROJECT_DIR)/test -type d)

CPPUTEST_WARNINGFLAGS = -Wall

INCLUDE_DIRS = \
	$(SRC_DIRS) \
	$(TEST_SRC_DIRS) \
	$(CPPUTEST_HOME)/include \

include $(CPPUTEST_HOME)/build/MakefileWorker.mk