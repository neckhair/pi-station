# PiStation

PiStation is a cli to read values from somewhere and put it to somewhere in a specific format. This is handy
to implement a customer weather station on a RaspberryPi. The original idea is to read temperature data from
a serial port or a webservice and put them into an elasticsearch instance.

This gem is work in progress and not ready yet.

## Testing the serial port

Serial Port inputs can be tested with the OS X pseudo terminals. These are tty pairs which do not have any
actual device. For example `/dev/ttyp1` and `/dev/ptyp1`.

```sh
bin/pi-station report --serial "/dev/ptyp1"
echo "TEMP:21.1" > /dev/ttyp1
```
