
# DockerBee
## a quick and easy killerbee

Killerbee:
https://github.com/riverloopsec/killerbee

## Install

Build the container:

`docker build -t docker-killerbee .`

To use GUI you have to add `docker` to xhost:

`xhost +local:docker`

This poses some security concerns, so you might want to revert later:

`xhost -local:docker`

### Alert
There are numerous security concern in using a Docker in privileged mode, sharing the X11 socket, adding docker to xhosts.
Please take in consideration those risks when using this app.

## Run

There are two ways to run the container, either you add a udev rule which enables read and write for everyone on USB tty devices, or you run the container in privileged mode, you choose.

### Method 1: udev rule
You have to add this line to `/etc/udev/rules.d/99-serial.rules` :
```KERNEL=="ttyUSB[0-9]*",MODE="0666"```

Then reload the udev rules:
```udevadm control --reload-rules && udevadm trigger```

And finally:
```bash launch_dockerbee.sh``` 

#### NOTE: if you have a different TTY name
Before running please check your tty's name, by default the script is using `/dev/ttyUSB0`, if your system uses another name then:

`bash launch_dockerbee.sh /dev/ttyMYUSB1`

### Method 2: privileged mode
Add the `--privileged` option to your command line:
`docker run -ti --rm i--privileged --net=host --cap-add=NET_ADMIN -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  --device=/dev/ttyUSB0 docker-killerbee`

