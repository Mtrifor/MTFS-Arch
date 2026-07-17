sudo pacman -S labwc --noconfirm
sudo pacman -S waybar --noconfirm
sudo pacman -S sddm --noconfirm
sudo pacman -S gtklock gtklock-userinfo-module gtklock-powerbar-module gtklock-playerctl-module --noconfirm
sudo pacman -S swayidle --noconfirm
sudo pacman -S nwg-drawer --noconfirm
sudo pacman -S blueman --noconfirm
#sudo pacman -S labwc --noconfirm
#sudo pacman -S labwc --noconfirm
#sudo pacman -S labwc --noconfirm


CARPETA="$HOME/.config/"

if [ ! -d "$CARPETA" ]; then
    echo "📂 La carpeta no existe, creándola..."
    mkdir -p "$CARPETA"
else
    echo "⏭️ La carpeta ya existe, saltando este paso..."
fi

ln -sf /home/maurotrifor/.pc-config/labwc /home/maurotrifor/.config/labwc
ln -sf /home/maurotrifor/.pc-config/waybar /home/maurotrifor/.config/waybar
ln -sf /home/maurotrifor/.pc-config/gtklock /home/maurotrifor/.config/gtklock
ln -sf /home/maurotrifor/.pc-config/ghostty /home/maurotrifor/.config/ghostty
ln -sf /home/maurotrifor/.pc-config/swaync /home/maurotrifor/.config/swaync
#ln -sf /home/maurotrifor/.pc-config/labwc /home/maurotrifor/.config/labwc
#ln -sf /home/maurotrifor/.pc-config/labwc /home/maurotrifor/.config/labwc
#ln -sf /home/maurotrifor/.pc-config/labwc /home/maurotrifor/.config/labwc
#ln -sf /home/maurotrifor/.pc-config/labwc /home/maurotrifor/.config/labwc
#ln -sf /home/maurotrifor/.pc-config/labwc /home/maurotrifor/.config/labwc

sudo systemctl enable sddm.service

sudo pacman -S ufw --noconfirm
sudo ufw enable
sudo systemctl enable ufw

sudo pacman -S yt-dlp ffmpeg vlc --noconfirm

sudo pacman -S swaync libnotify --noconfirm

sudo tee /usr/local/bin/usb-notify > /dev/null << 'SCRIPT'
#!/bin/bash
action="$1"
model="${2:-Dispositivo USB}"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus"
/usr/bin/notify-send -a USB -i media-removable "$action" "$model"
SCRIPT
sudo chmod +x /usr/local/bin/usb-notify

sudo tee /etc/udev/rules.d/99-usb-notify.rules > /dev/null << 'UDEV'
ACTION=="add", SUBSYSTEM=="usb", ENV{ID_MODEL}=="?*", RUN+="/usr/local/bin/usb-notify 'Conectado' '$env{ID_MODEL}'"
ACTION=="remove", SUBSYSTEM=="usb", ENV{ID_SERIAL_SHORT}=="?*", RUN+="/usr/local/bin/usb-notify 'Desconectado' '$env{ID_SERIAL_SHORT}'"
UDEV
sudo udevadm control --reload-rules
