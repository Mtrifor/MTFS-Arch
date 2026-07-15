sudo pacman -S labwc --noconfirm
sudo pacman -S waybar --noconfirm
sudo pacman -S sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg qt6-5compat --noconfirm --noconfirm
sudo pacman -S gtklock gtklock-userinfo-module gtklock-powerbar-module gtklock-playerctl-module --noconfirm
sudo pacman -S swayidle --noconfirm
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
#ln -sf /home/maurotrifor/.pc-config/ /home/maurotrifor/.config/
#ln -sf /home/maurotrifor/.pc-config/ /home/maurotrifor/.config/
#ln -sf /home/maurotrifor/.pc-config/ /home/maurotrifor/.config/

sudo systemctl enable sddm.service
