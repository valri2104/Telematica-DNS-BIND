# Proyecto Servidor DNS con BIND en WSL

## Introducción

Este proyecto consiste en la instalación, configuración y validación de un servidor DNS usando BIND9 dentro del Subsistema de Windows para Linux (WSL), utilizando Visual Studio Code como entorno de edición. El objetivo es levantar un DNS funcional con zonas directa e inversa para la resolución de nombres locales.

## Desarrollo

### 1. Instalación de BIND en WSL

Primero, actualizamos el sistema e instalamos BIND9:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install bind9 bind9utils bind9-doc dnsutils -y
```

Verificamos que el servicio esté activo:

```bash
sudo systemctl status bind9
```

Habilitamos el inicio automático:

```bash
sudo systemctl enable bind9
```

---

### 2. Estructura de Archivos de Configuración

#### a. Configuración global (`/etc/bind/named.conf.options`)

Editamos el archivo para definir opciones generales:

```bash
sudo nano /etc/bind/named.conf.options
```


#### b. Configuración local (`/etc/bind/named.conf.local`)

Aquí definimos las zonas que usará nuestro servidor:

```bash
sudo nano /etc/bind/named.conf.local
```


### 3. Crear Directorio y Archivos de Zona

#### a. Crear directorio para zonas

```bash
sudo mkdir -p /etc/bind/zones
```

#### b. Zona directa (`db.midominio.com`)

```bash
sudo nano /etc/bind/zones/db.midominio.com
```


#### c. Zona inversa (`db.192`)

```bash
sudo nano /etc/bind/zones/rev.1.168.192.db
```


### 4. Verificación de la Configuración

#### a. Verificar archivos de configuración

```bash
sudo named-checkconf
```

#### b. Verificar zonas

```bash
sudo named-checkzone midominio.com /etc/bind/zones/db.midominio.com
sudo named-checkzone 1.168.192.in-addr.arpa /etc/bind/zones/rev.1.168.192.db
```

---

### 5. Reiniciar el Servicio

```bash
sudo systemctl restart bind9
```

---

### 6. Probar el Servidor DNS

#### a. Usar `dig`

```bash
dig @localhost midominio.com
dig @localhost www.midominio.com
dig @localhost -x 192.168.1.10
```


## Aspectos Logrados y No logrados

### Logrados

- Instalación y ejecución de BIND9 en WSL.
- Creación de zonas directas e inversas personalizadas.
- Resolución de nombres y direcciones IP de manera local.
- Verificación de archivos y pruebas exitosas con `dig`.

### No logrados

- Configuración para resolución externa desde redes fuera del entorno WSL.

---

## Conclusiones

Este proyecto demostró cómo implementar un servidor DNS local en un entorno WSL de forma eficaz. Se aprendió a configurar los archivos fundamentales de BIND, definir zonas DNS y verificar su funcionamiento. Aunque el servidor solo está disponible localmente, proporciona una base sólida para entornos más complejos o productivos.
