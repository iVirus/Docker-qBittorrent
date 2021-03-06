#!/bin/bash
if [ ! -d "${XDG_CONFIG_HOME}/qBittorrent" ]; then
    install --directory "${XDG_CONFIG_HOME}/qBittorrent"
fi

if [ ! -f "${XDG_CONFIG_HOME}/qBittorrent/qBittorrent.conf" ]; then
    cat << 'EOF' > "${XDG_CONFIG_HOME}/qBittorrent/qBittorrent.conf"
[LegalNotice]
Accepted=true

[Preferences]
Connection\UPnP=false
Downloads\SavePath=/data/complete/
Downloads\TempPath=/data/incomplete/
Downloads\TempPathEnabled=true
General\Locale=en
WebUI\LocalHostAuth=false
WebUI\UseUPnP=false
EOF
fi

$(which qbittorrent-nox) \
    --webui-port=${QBITTORRENT_WEBUI_PORT} \
    --daemon

/etc/qbittorrent/port.sh &
