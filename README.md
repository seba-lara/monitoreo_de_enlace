# 🔗 Network Link Monitor

![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?logo=gnubash&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-CentOS%20%2F%20RHEL%207-red)
![Area](https://img.shields.io/badge/Area-Networking%20%2F%20SysAdmin-orange)

Suite de scripts Bash para monitoreo continuo de un enlace de red entre dos
servidores Linux. Registra latencia, uptime y trazado de ruta en logs rotativos,
con instalación remota desde Windows o Linux vía SSH.

---

## 📌 Caso de uso

> En entornos industriales donde se requiere monitorear la disponibilidad
> y calidad de un enlace de red entre dos servidores remotos, esta herramienta
> permite detectar caídas, medir latencia y registrar trazados de ruta de forma
> automática y continua, sin depender de herramientas externas de monitoreo.

---

## ⚙️ ¿Qué hace?

- **Latencia:** ejecuta ping cada minuto y registra métricas de red (min/avg/max/mdev)
- **Uptime:** verifica disponibilidad del host; ante falla, dispara traceroute automáticamente
- **Traceroute:** registra la ruta completa al destino (máx. 10 saltos) con timestamp
- **Rotación de logs:** límite de 10MB por archivo, evita llenado de disco
- **Instalación remota:** desde Windows (.bat) o Linux (.sh) vía SSH + SCP

---

## 🚀 Instalación

### Requisitos previos

- Acceso SSH con llave privada al servidor destino
- Servidor destino: CentOS/RHEL 7

### Desde Windows

```bat
install_windows.bat
```

### Desde Linux

```bash
chmod +x install_linux.sh
./install_linux.sh
```

El instalador despliega los scripts en el servidor remoto, configura cron
y deja accesos directos en el escritorio para extraer logs y desinstalar.

---

## ⚙️ Configuración

Antes de instalar, edita las IPs en los archivos dentro de `config/`:

| Archivo | Variable a cambiar |
|---|---|
| `latency.sh` | IP del host destino |
| `traceroute.sh` | `TGT` |
| `uptime.sh` | `TARGET` |
| `install_windows.bat` / `install_linux.sh` | IP del servidor remoto |

---

## 📊 Estructura de logs

| Ruta | Contenido |
|---|---|
| `/var/log/monitoreo/latency.log` | Métricas de latencia (ping) |
| `/var/log/monitoreo/uptime.log` | Eventos de caída y recuperación |
| `/var/log/monitoreo/traceroute.log` | Trazados de ruta con timestamp |

---

## 📥 Extracción de logs desde Windows

```bat
Extraer_datos.bat
```

Copia los logs del servidor remoto al directorio local vía SCP.

---

## 🗂️ Estructura del proyecto

```
monitoreo_de_enlace/
│
├── config/
│   ├── latency.sh          # Medición de latencia vía ping
│   ├── traceroute.sh       # Trazado de ruta con timestamp
│   ├── uptime.sh           # Verificación de disponibilidad del host
│   ├── install.sh          # Instalador en servidor remoto
│   └── root                # Configuración de tareas cron
│
├── install_windows.bat     # Instalador remoto desde Windows
├── install_linux.sh        # Instalador remoto desde Linux
├── uninstall.bat           # Desinstalador desde Windows
├── extract_data.bat        # Extracción de logs desde Windows vía SCP
└── README.md
```

---

## 🛑 Desinstalación

**Windows:**

```bat
Desinstalar.bat
```

**Linux (en el servidor):**

```bash
/root/monitoreo/uninstall.sh
```

Elimina scripts, desinstala traceroute y respalda los logs en `/root/log_monitoreo.BAK`.

---

## 🛠️ Tecnologías

- **Bash scripting**
- **Cron** — ejecución automática cada minuto
- **SSH / SCP** — instalación y extracción de logs de forma remota
- **RPM** — traceroute 2.0.22 para CentOS/RHEL 7
- **ICMP** — ping para medición de latencia y disponibilidad

---

## 👤 Autor

**Sebastián Lara**
- GitHub: [@seba-lara](https://github.com/seba-lara)
