FROM px4io/px4-dev-ros-noetic

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update
RUN apt-get install -y git 
RUN git clone -b v1.14.0 https://github.com/PX4/PX4-Autopilot.git --recursive

WORKDIR /PX4-Autopilot

RUN make px4_sitl 