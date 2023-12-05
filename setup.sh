#!/bin/sh

echo "Setup OpenVPN by Francesco Bianco"

echo "set KEY_COUNTRY=IT" > vars.bat
echo "set KEY_PROVINCE=TP" >> vars.bat
echo "set KEY_CITY=Castelvetrano" >> vars.bat
echo "set KEY_ORG=OpenVPN" >> vars.bat
echo "set KEY_EMAIL=bianco@javanile.org" >> vars.bat
echo "set DH_KEY_SIZE=2048" >> vars.bat

./easyrsa init-pki

./vars.bat

./easyrsa clean-all

./easyrsa build-ca

./easyrsa build-server-full server

for index in 1 2 3 4; do
  echo "==========="
  echo " Client #${index}"
  echo "==========="
  ./easyrsa build-client-full client${index}
done

./easyrsa gen-dh

cp pki/ca.crt "C:/Program Files/OpenVPN/config"
cp pki/dh.pem "C:/Program Files/OpenVPN/config"
cp pki/issued/server.crt "C:/Program Files/OpenVPN/config"
cp pki/private/server.key "C:/Program Files/OpenVPN/config"
"C:/Program Files/OpenVPN/bin/openvpn.exe" --genkey tls-auth "C:/Program Files/OpenVPN/config/ta.key"

cp "C:/Program Files/OpenVPN/sample-config/server.ovpn" "C:/Program Files/OpenVPN/config"
mv -f "C:/Program Files/OpenVPN/config/server.ovpn" "C:/Program Files/OpenVPN/config/server.ovpn.0"

./bin/sed -e 's/^ca .*/ca "C:\\\\Program Files\\\\OpenVPN\\\\config\\\\ca.crt"/g' "C:/Program Files/OpenVPN/config/server.ovpn.0" > "C:/Program Files/OpenVPN/config/server.ovpn.1"
./bin/sed -e 's/^cert .*/cert "C:\\\\Program Files\\\\OpenVPN\\\\config\\\\server.crt"/g' "C:/Program Files/OpenVPN/config/server.ovpn.1" > "C:/Program Files/OpenVPN/config/server.ovpn.2"
./bin/sed -e 's/^key .*/key "C:\\\\Program Files\\\\OpenVPN\\\\config\\\\server.key"/g' "C:/Program Files/OpenVPN/config/server.ovpn.2" > "C:/Program Files/OpenVPN/config/server.ovpn.3"
./bin/sed -e 's/^dh .*/dh "C:\\\\Program Files\\\\OpenVPN\\\\config\\\\dh.pem"/g' "C:/Program Files/OpenVPN/config/server.ovpn.3" > "C:/Program Files/OpenVPN/config/server.ovpn.4"
./bin/sed -e 's/^tls-auth .*/tls-auth "C:\\\\Program Files\\\\OpenVPN\\\\config\\\\ta.key"/g' "C:/Program Files/OpenVPN/config/server.ovpn.4" > "C:/Program Files/OpenVPN/config/server.ovpn.5"

mv -f "C:/Program Files/OpenVPN/config/server.ovpn.5" "C:/Program Files/OpenVPN/config/server.ovpn"
