# Chinese Bluetooth Lady
Adds the Chinese Bluetooth Lady voice for connecting and disconnecting Bluetooth devices on Linux.


## Dependencies

### Debian/Ubuntu:
```
sudo apt install libsox-fmt-mp3 bluetoothctl
```
> [!NOTE]
> Other distributions, such as Arch and Fedora are not yet officially supported.


## Installation
Clone the repository to your local machine:
```
git clone https://github.com/Pahheb/chinese-bluetooth-lady
```
Enter the directory:
```
cd chinese-bluetooth-lady
```
Run the shell file:  
- *Option 1:*
```
chinese_bluetooth_lady.sh
```
- *Option 2 (If bash is not your default shell):*
```
sh chinese_bluetooth_lady.sh
```

## Autostart on boot (optional)

> [!NOTE]
> The following options were interpreted from [Baeldung](https://www.baeldung.com/linux/run-script-on-startup).

### Option 1: Cron
You must edit the crontab file by firstly writing this:
```
crontab -e
```
And then adding the following line, where `/path/to/chinese_bluetooth_lady.sh` represents the location of the script:
```
@reboot sh /path/to/chinese_bluetooth_lady.sh
```

### Option 2: rc.local
You must append the following line to rc.local, which already runs at every bootup by editing:
```
/etc/rc.d/rc.local
```
And adding the following line, where `/path/to/chinese_bluetooth_lady.sh` represents the location of the script:
```
sh /path/to/chinese_bluetooth_lady.sh
```
And then, make sure that the rc.local file is executable for it to work:
```
chmod +x /etc/rc.d/rc.local
```

### Option 3: Systemd service
You must create a `chinese_bluetooth_lady.service` file under /etc/systemd/system with the following content, where `/path/to/chinese_bluetooth_lady.sh` represents the location of the script:
```
[Unit]
Description=Reboot message systemd service.

[Service]
Type=simple
ExecStart=/bin/bash /path/to/chinese_bluetooth_lady.sh

[Install]
WantedBy=multi-user.target
```
And then enable it with the following commands:
```
chmod 644 /etc/systemd/system/chinese_bluetooth_lady.service
systemctl enable chinese_bluetooth_lady.service
```

## Customization
To make *"The Bluetooth device is ready to pair"* sound play at initial PC bootup, uncomment the following command on ***line 22***:
https://github.com/Pahheb/chinese-bluetooth-lady/blob/ad1d71ff31c33abe24bd91c484113f13a4aed914/chinese_bluetooth_lady.sh#L22

The checking interval of the connected bluetooth device is set to 3 seconds by deault, which results in a slight delay of the sound being played when a device is paired/disconnected.

This interval can be adjusted on ***line 44*** to be quicker (higher CPU usage), or slower (higher delay):
https://github.com/Pahheb/chinese-bluetooth-lady/blob/ad1d71ff31c33abe24bd91c484113f13a4aed914/chinese_bluetooth_lady.sh#L44
