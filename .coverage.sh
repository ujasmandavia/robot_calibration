#!/bin/bash

source "${ICI_SRC_PATH}/workspace.sh"
source "${ICI_SRC_PATH}/util.sh"

echo "Generating coverage for robot_calibration"

ws=~/target_ws
extend="/opt/ros/$ROS_DISTRO"
ici_exec_in_workspace "$extend" "$ws" catkin build robot_calibration -v --no-deps --catkin-make-args robot_calibration_coverage_report

echo "Uploading coverage results to codecov.io"

bash <(curl -s https://codecov.io/bash) -s "$ws/build/robot_calibration/"
