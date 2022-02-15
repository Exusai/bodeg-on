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

echo_and_run cd "/home/faber/bodeg-on/src/ROS-TCP-Endpoint"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/faber/bodeg-on/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/faber/bodeg-on/install/lib/python3/dist-packages:/home/faber/bodeg-on/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/faber/bodeg-on/build" \
    "/usr/bin/python3" \
    "/home/faber/bodeg-on/src/ROS-TCP-Endpoint/setup.py" \
    egg_info --egg-base /home/faber/bodeg-on/build/ROS-TCP-Endpoint \
    build --build-base "/home/faber/bodeg-on/build/ROS-TCP-Endpoint" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/faber/bodeg-on/install" --install-scripts="/home/faber/bodeg-on/install/bin"
