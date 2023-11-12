#!/bin/bash
# enable access to xhost from the container
docker rm -f bicopter_sim


DIR_PATH=$(pwd)
xhost si:localuser:root

docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --mount type=bind,src=$DIR_PATH/../bicopter_ws,dst=/bicopter_ws \
    -p 14570:14570/udp \
    px4_noetic:1.0 \
    /bin/bash
    
export containerId=$(docker ps -l -q)

# sudo xhost +si:localuser:root
# XSOCK=/tmp/.X11-unix

# XAUTH=/tmp/.docker.xauth
# xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
# if [ ! -f $XAUTH ]
# then
#     echo XAUTH file does not exist. Creating one...
#     touch $XAUTH
#     chmod a+r $XAUTH
#     if [ ! -z "$xauth_list" ]
#     then
#         echo $xauth_list | xauth -f $XAUTH nmerge -
#     fi
# fi

# # Prevent executing "docker run" when xauth failed.
# if [ ! -f $XAUTH ]
# then
#   echo "[$XAUTH] was not properly created. Exiting..."
#   exit 1
# fi


# # Run docker
# docker run -it --privileged \
#     --gpus all \
#     --env=LOCAL_USER_ID="$(id -u)" \
#     -v ./image/PX4-Autopilot:/PX4-Autopilot:rw \
#     -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#     -e DISPLAY=:0 \
#     -p 14570:14570/udp \
#     --name=bicopter_sim px4_noetic:1.0 /bin/bash

# sudo xhost -si:localuser:root