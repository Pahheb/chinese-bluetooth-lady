# Chinese Bluetooth Lady
Adds the Chinese Bluetooth Lady voice for connecting and disconnecting Bluetooth devices on Linux.


## Dependencies

### Debian/Ubuntu:
```
sudo apt install libsox-fmt-mp3 bluetoothctl
```
> [!NOTE]
> Other distributions, such as Arch and Fedora are not yet officially supported


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

## Autostart (optional)
### Systemd service
You can create a systemd service to launch the script upon bootup


## Customization
To make *"The Bluetooth device is ready to pair"* sound play at initial PC bootup, uncomment the following command on ***line 22***:
https://github.com/Pahheb/chinese-bluetooth-lady/blob/ad1d71ff31c33abe24bd91c484113f13a4aed914/chinese_bluetooth_lady.sh#L22

The checking interval of the connected bluetooth device is set to 3 seconds by deault, which results in a slight delay of the sound being played when a device is paired/disconnected.

This interval can be adjusted on ***line 44*** to be quicker (higher CPU usage), or slower (higher delay):
https://github.com/Pahheb/chinese-bluetooth-lady/blob/ad1d71ff31c33abe24bd91c484113f13a4aed914/chinese_bluetooth_lady.sh#L44
