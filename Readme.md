
# DockerBee
## a quick and easy to use killerbee

Killerbee:
https://github.com/riverloopsec/killerbee

### Install

You can build the container:
```docker build -t docker-killerbee .```

There's two way to run the container, either you add a udev rule to load USB serial devices with read and write privileges for everyone, or you run the container in privileged mode, you choose.

!!! Before running please check your tty's name, in this example I'm using `/dev/ttyUSB0` but in your system it might differ.

#### Launch with udev rule
You have to add this line to /etc/udev/rules.d/99-serial.rules to be able to pass the serial port:
```KERNEL=="ttyUSB[0-9]*",MODE="0666"```

Then reload the udev rules:
```udevadm control --reload-rules && udevadm trigger```

And finally:
```docker run -ti --device=/dev/ttyUSB0 docker-killerbee```


#### Launch in privileged mode
If you didn't load the udev rule:
```docker run -ti --privileged --device=/dev/ttyUSB0 docker-killerbee```

