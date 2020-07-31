echo copiando llaves ssh...
TYPE "ssh\si_key" > "%userprofile%\.ssh\si_key"
TYPE "ssh\si_key.pub" >> "%userprofile%\.ssh\known_hosts"

echo instalando traceroute...
scp -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" traceroute-2.0.22-2.el7.x86_64.rpm root@10.75.10.166:/root
ssh -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@10.75.10.166 rpm -i /root/traceroute-2.0.22-2.el7.x86_64.rpm
echo instalando aplicacion...
scp -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -r config root@10.75.10.166:/root/
ssh -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@10.75.10.166 /bin/bash /root/config/install.sh
ssh -i "%userprofile%\.ssh\si_key" -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@10.75.10.166 rm -rf /root/config

MKDIR "%userprofile%\Desktop\monitoreo"
TYPE "Extract_data.bat" > "%userprofile%\Desktop\monitoreo\Extraer_datos.bat"
MKDIR "%userprofile%\Desktop\monitoreo\desinstalar"
TYPE "unistall.bat" > "%userprofile%\Desktop\monitoreo\desinstalar\Desinstalar.bat"
