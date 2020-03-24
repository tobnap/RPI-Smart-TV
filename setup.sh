# Install kodi
sudo apt-get install -y kodi

# Install netflix
sudo apt install -y build-essential python-dev python-pip python-setuptools
pip install --user pycryptodomex
wget https://github.com/castagnait/repository.castagnait/raw/master/repository.castagnait-1.0.0.zip

# Install Steam link and the kodi addon for it
wget https://github.com/bigbrozer/kodi-steamlink-launcher/releases/download/v0.0.2/kodi-steamlink-launcher-v0.0.2.zip
sudo useradd -m -U -G "audio,bluetooth,input,plugdev,video" -s /bin/bash -u 999 kodi
cat <<EOF | sudo tee /etc/systemd/system/kodi.service
[Unit]
Description = Kodi Media Center
After = systemd-user-sessions.service network.target sound.target

[Service]
User = kodi
Group = kodi
Type = simple
ExecStart = /usr/bin/kodi
Restart = always
RestartSec = 15

[Install]
WantedBy = multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable kodi
sudo systemctl start kodi
sudo apt-get install -y steamlink
cat <<EOF | sudo tee /etc/sudoers.d/steamlink-kodi
kodi ALL=(root) NOPASSWD: /bin/systemctl stop kodi, /bin/systemctl restart kodi, /bin/openvt
EOF