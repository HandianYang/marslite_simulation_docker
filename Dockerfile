FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04
LABEL maintainer="HandianYang" email="ych0610765@gmail.com"

# ROS Noetic
ENV ROS_DISTRO=noetic
ENV ROS_ROOT=/opt/ros/${ROS_DISTRO}
ENV DEBIAN_FRONTEND=noninteractive

# Our project
ARG WORK_DIR=/home/developer
ARG CATKIN_WS=marslite_simulation_ws

# Set an individual working directory
WORKDIR ${WORK_DIR}

# Set ~ to the working directory
ENV HOME ${WORK_DIR}

# Copy the contents of the current directory to the working directory
COPY . ${WORK_DIR}



# Install common-and-useful packages
RUN apt-get update && \
    apt-get install -y \
        python3-pip \
        vim \
        wget

# Install ROS Noetic and its dependencies
RUN apt-get install -y \
        curl \
        gnupg2 \
        lsb-release && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y \
        ros-${ROS_DISTRO}-desktop-full \
        build-essential \
        python3-rosdep \
    	python3-rosinstall \
    	python3-rosinstall-generator \
    	python3-wstool && \
    rosdep init && \
    rosdep update

# Install NVIDIA-util package for NVIDIA-driver-515
RUN apt-get update && \
    apt-get install -y \
        nvidia-utils-515

# Install ROS Noetic Moveit!
RUN apt-get update && \
    apt-get install -y \
        ros-${ROS_DISTRO}-moveit

# Install other packages
RUN apt-get install -y \
        # dependencies for marslite robot
        ros-${ROS_DISTRO}-gripper-action-controller \
        ros-${ROS_DISTRO}-hector-models \
        ros-${ROS_DISTRO}-ira-laser-tools \
        ros-${ROS_DISTRO}-joint-trajectory-controller \
        # dependencies for visual tools
        ros-${ROS_DISTRO}-moveit-visual-tools \
        ros-${ROS_DISTRO}-rviz-visual-tools \
        # dependencies for navigation
        ros-${ROS_DISTRO}-amcl \
        ros-${ROS_DISTRO}-gmapping \
        ros-${ROS_DISTRO}-map-server \
        ros-${ROS_DISTRO}-move-base-msgs \
        # ROS#
        ros-${ROS_DISTRO}-rosbridge-server && \
    # Remove cached package lists
    rm -rf /var/lib/apt/lists/*
   
# Set some alias and environment variables
RUN echo "alias cm='catkin_make'" > /tmp/bashrc_temp && \
    echo "alias sd='source ${WORK_DIR}/${CATKIN_WS}/devel/setup.bash'" >> /tmp/bashrc_temp && \
    echo "" >> /tmp/bashrc_temp && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /tmp/bashrc_temp && \
    echo "source /usr/share/gazebo-11/setup.sh" >> /tmp/bashrc_temp && \
    echo "export GAZEBO_MODEL_PATH=${WORK_DIR}/${CATKIN_WS}/src/mars_lite_description/models:\$GAZEBO_MODEL_PATH" \
    	>> /tmp/bashrc_temp

# Append to the ~/.bashrc file and delete the temporary file
RUN cat /tmp/bashrc_temp >> ${WORK_DIR}/.bashrc && \
    rm /tmp/bashrc_temp


# Set environment variables for NVIDIA-utils
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
