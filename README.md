# openvpn-for-windows

OpenVPN per Windows, installazione agevolata

## Installazione

1. Installare l'ultima versione di OpenVPN server inserendo l'utility EasyRSA <https://wiki.teltonika-networks.com/view/OpenVPN_server_on_Windows>
2. Scaricare da questo link il file ZIP di installazione <https://github.com/francescobianco/openvpn-for-windows/archive/refs/heads/main.zip> 
3. Estrarre il contenuto ed eseguire facendo doppio click sul file 'setup.bat'


## Other info

Based on <https://wiki.teltonika-networks.com/view/OpenVPN_server_on_Windows>

### Steps

1. Custom install from <https://openvpn.net/community-downloads/> adding EasyRSA Scripts Tool
2. Open 'cmd.exe' than 'cd "C:\Program Files\OpenVPN\easy-rsa" && EasyRSA-Start.bat'
3. Type './setup.sh US CA SanFrancisco OpenVPN mail@host.domain passwordserver passwordclient'

set KEY_COUNTRY=US
set KEY_PROVINCE=CA
set KEY_CITY=SanFrancisco
set KEY_ORG=OpenVPN
set KEY_EMAIL=mail@host.domain
