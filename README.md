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
