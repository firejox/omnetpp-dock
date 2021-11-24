from archlinux:base-devel as env-build

run pacman -Syyu --noconfirm &&\
    pacman -Sy --needed --noconfirm \
        git python3 python-pip openscenegraph curl\
        openmpi \
        gdal minizip qt5-base rocksdb duktape cmake \
        jdk-openjdk jre-openjdk java-openjfx  java-environment-common java-runtime-common \
        swig doxygen graphviz libpcap tcl qt5-svg \
        ffmpeg && \
    pip install posix-ipc numpy scipy pandas matplotlib  && \
    pacman -Sc

from env-build as omnetpp-build
run curl -L https://github.com/omnetpp/omnetpp/releases/download/omnetpp-6.0pre11/omnetpp-6.0pre11-src-linux.tgz|tar -zxv &&\
    cd /omnetpp-6.0pre11 && \
    source ./setenv -f && ./configure WITH_OSGEARTH=no PREFER_CLANG=no && make

from env-build as inet-build
copy --from=omnetpp-build /omnetpp-6.0pre11 /omnetpp-6.0pre11
run cd /omnetpp-6.0pre11 && source ./setenv -f && \
    curl -L https://github.com/inet-framework/inet/releases/download/v4.3.2/inet-4.3.2-src.tgz | tar -zxv -C /omnetpp-6.0pre11/samples && \
    cd /omnetpp-6.0pre11/samples/inet4.3 && \
    source ./setenv -f && make makefiles && make

from env-build as simu5g-build
copy --from=inet-build /omnetpp-6.0pre11 /omnetpp-6.0pre11
run cd /omnetpp-6.0pre11 && source ./setenv -f && cd /omnetpp-6.0pre11/samples/inet4.3 && source ./setenv -f && \
    curl -L https://github.com/Unipisa/Simu5G/archive/refs/tags/v1.2.0.tar.gz | tar -zxv -C /omnetpp-6.0pre11/samples && \
    cd /omnetpp-6.0pre11/samples/Simu5G-1.2.0 && \
    source ./setenv -f && make makefiles && make

from env-build
label maintainer.name="Firejox"
label maintainer.email="firejox@gmail.com"

copy --from=simu5g-build /omnetpp-6.0pre11 /omnetpp-6.0pre11
run chown -hR 1000 /omnetpp-6.0pre11

cmd ["/bin/bash"]
