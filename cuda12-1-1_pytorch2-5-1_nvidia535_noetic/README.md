# marslite_simulation:`cuda12.1.1-pytorch2.5.1-nvidia535-noetic`

## [Note] This Docker image tag is DEPRECATED! Use `cuda12.1.1-pytorch2.5.1-noetic` instead!

## Prerequisites (of your device)
* NVIDIA GPU along with driver version >=535 (tested well on GeForce RTX 3060)
* `Docker` installed
* `nvidia-docker2` installed

## Operating system: Ubuntu 20.04 LTS

## Crucial packages
* ROS Noetic
* ROS Noetic Moveit!
* CUDA 12.1.1
* Pytorch 2.5.1
* ultralytics (for YOLO)
* NVIDIA-util package 535
* ROS-sharp (for wireless communication of ROS topics)

## Tools and dependencies
* Common tools:
  - `vim`
  - `tmux`
  - `wget`
* Python tools:
  - `python3.10`
  - `python3.10-dev`
  - `python3-pip`
  - `libffi-dev`
  - `libssl-dev`
  - `software-properties-common`
* Dependencies for ROS Noetic
  - `curl`
  - `gnupg2`
  - `lsb-release`
* Dependencies for ROS building packages
  - `build-essential`
  - `python3-rosdep`
  - `python3-rosinstall`
  - `python3-rosinstall-generator`
  - `python3-wstool`
* Dependencies for marslite robot
  - `ros-${ROS_DISTRO}-gripper-action-controller`
  - `ros-${ROS_DISTRO}-hector-models`
  - `ros-${ROS_DISTRO}-ira-laser-tools`
  - `ros-${ROS_DISTRO}-joint-trajectory-controller`
* Dependencies for visualization
  - `ros-${ROS_DISTRO}-moveit-visual-tools`
  - `ros-${ROS_DISTRO}-rviz-visual-tools`
* Dependencies for navigation and localization
  - `ros-${ROS_DISTRO}-amcl`
  - `ros-${ROS_DISTRO}-dwa-local-planner`
  - `ros-${ROS_DISTRO}-gmapping`
  - `ros-${ROS_DISTRO}-map-server`
  - `ros-${ROS_DISTRO}-move-base`
  - `ros-${ROS_DISTRO}-move-base-msgs`

## Other features

### Alias
* `cm`: `catkin_make`
* `sd`: `source devel/setup.bash`