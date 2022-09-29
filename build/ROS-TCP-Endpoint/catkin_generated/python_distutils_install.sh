#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ubuntu/bodeg-on/src/ROS-TCP-Endpoint"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ubuntu/bodeg-on/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ubuntu/bodeg-on/install/lib/python3/dist-packages:/home/ubuntu/bodeg-on/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ubuntu/bodeg-on/build" \
    "/usr/bin/python3" \
    "/home/ubuntu/bodeg-on/src/ROS-TCP-Endpoint/setup.py" \
    egg_info --egg-base /home/ubuntu/bodeg-on/build/ROS-TCP-Endpoint \
    build --build-base "/home/ubuntu/bodeg-on/build/ROS-TCP-Endpoint" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ubuntu/bodeg-on/install" --install-scripts="/home/ubuntu/bodeg-on/install/bin"
