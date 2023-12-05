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
