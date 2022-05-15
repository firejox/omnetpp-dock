# omnetpp-dock [![deploy to docker hub](https://github.com/firejox/omnetpp-dock/actions/workflows/deploy.yaml/badge.svg)](https://github.com/firejox/omnetpp-dock/actions/workflows/deploy.yaml)

Docker image for network simulator [omnetpp](https://github.com/omnetpp/omnetpp) with [Simu5G](https://github.com/Unipisa/Simu5G) support based on [x11docker](https://github.com/mviereck/x11docker)

## Installation

You can pull the image from dockerhub or clone and built this project locally

```sh
docker pull firejox/omnetpp-dock
```

## Usage

The following command will start `omnetpp` automatically. The omnetpp source code will be located in`/omnetpp`.

```sh
x11docker firejox/omnetpp-dock
```

If you want to start an interactive shell, just run

```sh
x11docker -i firejox/omnetpp-dock
```

## Experimental Images

### Without x11docker

The image with tag `xpra` is the experimental image for open the GUI without relying on x11docker. It use [xpra](https://github.com/Xpra-org/xpra) to run seamleass GUI application. It use the network port `9876` to connect by default. Here is an example.

* Server
```sh
docker run -p host:port:9876 firejox/omnetpp-dock:xpra
```

* Client
```sh
xpra attach tcp://host:port
```

**warning:**  Do not expose the port on public network, because there is no authentication and encryption.
