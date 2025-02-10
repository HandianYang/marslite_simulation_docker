Version 1.2.0 (Jan 07, 2025)
----------------------------

New features:
* Support object detection using D435 cameras
* Support point-cloud building using D435 cameras

Main changes:
* Installed `ros-$ROS_DISTRO-realsense2-camera` for Realsense D435i camera
* Installed `ros-$ROS_DISTRO-rtabmap*` for point cloud building
* Created a Python3.10-based virtual environment for object detection, with the following packages installed:
  - `pyrealsense2`
  - `ultralytics` (for YOLO)
  - `supervision`

Version 1.1.0 (Nov 25, 2024)
----------------------------

New features:
* Support QP solver for MPC problems

Main changes:
* Upgraded `cmake` to `3.30.2`
* Installed `osqp` under `/usr/local/include`
* Installed `OsqpEigen` under `/usr/local/include`

Minor changes:
* Added Visual Studio Code extensions: 
  - C/C++
  - Python 
  - CMake
  - GitHub Copilot
* Installed `tree` package
* Add aliases:
  - `here='export ROS_HOSTNAME=localhost && export ROS_MASTER_URI=http://localhost:11311'`
  - `mars='export ROS_MASTER_URI=http://192.168.50.77:11311'`

Version 1.0.0 (Nov 25, 2024)
----------------------------

* Crucial packages:
  * ROS Noetic
  * ROS Noetic Moveit!
  * CUDA 12.1.1
  * Pytorch 2.5.1
  * ultralytics (for YOLO)
  * ROS-sharp (for wireless communication of ROS topics)
* Added `nvidia-` and `libnvidia-` packages to `Unattended-Upgrade::Package-Blacklist {}`
