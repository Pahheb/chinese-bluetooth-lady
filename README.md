# Chinese Bluetooth Lady
Adds the Chinese Bluetooth Lady voice for connecting and disconnecting Bluetooth devices in Linux.


## Dependencies

### Debian/Ubuntu:
sudo apt install libsox-fmt-mp3 bluetoothctl

### Other distros:
Other distributions, such as Arch and Fedore are not yet officially supported


## Installation
Clone the repository to your local machine
```
git clone https://github.com/Pahheb/chinese-bluetooth-lady
```
Enter the directory
```
cd chinese-bluetooth-lady
```
Run the sh file 
Option 1:
```
chinese_bluetooth_lady.sh
```
Option 2 (If bash is not your default shell):
```
sh chinese_bluetooth_lady.sh
```

## Autostart (optional)
### Systemd service
You can create a systemd service to launch the script upon bootup
