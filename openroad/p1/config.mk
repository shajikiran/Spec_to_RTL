CONFIG_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PROJECT_ROOT := $(abspath $(CONFIG_DIR)/../..)

export DESIGN_NAME = seq_detector_0011
export PLATFORM = nangate45

export VERILOG_FILES = $(PROJECT_ROOT)/rtl/p1_design.v
export SDC_FILE = $(CONFIG_DIR)/constraint.sdc

# Small control block: use explicit floorplan bounds to keep the first run simple.
export DIE_AREA = 0 0 100 100
export CORE_AREA = 10 10 90 90

export CLOCK_PORT = clk
export CLOCK_PERIOD = 10
