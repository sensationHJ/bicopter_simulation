FROM px4io/px4-dev-ros-noetic

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update
RUN apt-get install -y git python3-wstool
RUN apt-get install -y ros-noetic-mavros ros-noetic-mavros-extras ros-noetic-mavros-msgs ros-noetic-rqt ros-noetic-rqt-common-plugins ros-noetic-rqt ros-noetic-rqt-common-plugins ros-noetic-rqt-common-plugins
RUN apt-get install -y ros-noetic-joy ros-noetic-octomap-ros ros-noetic-mavlink python3-catkin-tools protobuf-compiler libgoogle-glog-dev ros-noetic-control-toolbox  ros-noetic-xacro ros-noetic-robot-state-publisher ros-noetic-joint-state-publisher


RUN git clone -b v1.14.0 https://github.com/PX4/PX4-Autopilot.git --recursive

WORKDIR /PX4-Autopilot

RUN make px4_sitl


RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc