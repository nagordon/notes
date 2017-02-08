

```
sudo raspi-config
```

To make this a permanent change, you need to run RetroPie-Setup. Get into a terminal using either of the above two methods (Ctrl-Alt-F2 or SSH) and enter:
```
cd RetroPie-Setup
sudo ./retropie_setup.sh
```

```
sudo nano /boot/config.txt
hdmi_drive=2
hdmi_force_hotplug=1
hdmi_safe=1
```
