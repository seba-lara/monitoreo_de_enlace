echo copiando llaves ssh...
cat "ssh\si_key" > "%userprofile%\.ssh\si_key"
cat "ssh\si_key.pub" >> "%userprofile%\.ssh\known_hosts"

echo instalando traceroute...
scp -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" traceroute-2.0.22-2.el7.x86_64.rpm root@<IP_DESTINO>:/root
ssh -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@<IP_DESTINO> rpm -i /root/traceroute-2.0.22-2.el7.x86_64.rpm
echo instalando aplicacion...
scp -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -r config root@<IP_DESTINO>:/root/
ssh -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@<IP_DESTINO> /bin/bash /root/config/install.sh
ssh -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@<IP_DESTINO> rm -rf /root/config

mkdir "%userprofile%\Desktop\monitoreo"
cat "Extract_data.bat" > "%userprofile%\Desktop\monitoreo\Extraer_datos.bat"
mkdir -f "%userprofile%\Desktop\monitoreo\desinstalar"
cat "unistall.bat" > "%userprofile%\Desktop\monitoreo\desinstalar\Desinstalar.bat"
