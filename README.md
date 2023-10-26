# openvpn-for-windows

Based on <https://wiki.teltonika-networks.com/view/OpenVPN_server_on_Windows>

## Steps

1. Custom install from <https://openvpn.net/community-downloads/> adding EasyRSA Scripts Tool
2. Open 'cmd.exe' than 'cd "C:\Program Files\OpenVPN\easy-rsa" && EasyRSA-Start.bat'
3. Type './setup.sh US CA SanFrancisco OpenVPN mail@host.domain passwordserver passwordclient'



set KEY_COUNTRY=US
set KEY_PROVINCE=CA
set KEY_CITY=SanFrancisco
set KEY_ORG=OpenVPN
set KEY_EMAIL=mail@host.domain