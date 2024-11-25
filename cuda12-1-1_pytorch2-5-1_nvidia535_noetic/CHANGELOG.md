## [Note] This Docker image tag is DEPRECATED! Use `cuda12.1.1-pytorch2.5.1-noetic` instead!

Version 1.1.2 (Nov 22, 2024)
----------------------------

* Added alias: `here = 'export ROS_HOSTNAME=localhost && export ROS_MASTER_URI=http://localhost:11311'`
* Added alias: `mars = 'export ROS_MASTER_URI=http://192.168.50.77:11311'`


Version 1.1.1 (Nov 19, 2024)
----------------------------

* Changed `eigen3` path from `/usr/local/include/eigen3` to `/usr/include/eigen3`
* Installed `tree` package

Version 1.1.0 (Nov 18, 2024)
----------------------------

New features:
* Support QP solver for MPC problems

Main changes:
* Upgraded `cmake` to `3.30.2`
* Upgraded `Eigen3` to `3.4.0`
* Installed `osqp` under `/usr/local/include`
* Installed `OsqpEigen` under `/usr/local/include`

Minor changes:
* Added Visual Studio Code extensions: 
  - C/C++
  - CMake
  - GitHub Copilot


Version 1.0.0 (Nov 16, 2024)
----------------------------

Crucial packages:
* ROS Noetic
* ROS Noetic Moveit!
* CUDA 12.1.1
* Pytorch 2.5.1
* ultralytics (for YOLO)
* NVIDIA-util package 535
* ROS-sharp (for wireless communication of ROS topics)
