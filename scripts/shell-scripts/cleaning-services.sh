#!/usr/bin/env bash

# Important: (---)
# Context:   (+++)

# -------
#
# -------
analizing-services () {
    echo -e "\e[32m[INFO/INIT]: Analizando los servicios que el servidor no utiliza...\e[0m"

    systemd-analyze blame

    echo -e "\e[32m[INFO/CLEAN]: ELiminando servicios inecesarios del servidor...\e[0m"

    # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # Primero pausamos y desactivamos el servicio para que no se utilize durante el proceso
    # de desactivación.
    #
    # - sudo systemctl stop <nombre-del-servicio> && sudo systemctl disable <nombre-del-servicio>
    #
    #
    # Después del proceso seguro se en mascaran los procesos como medida extrema
    # para que el servicio no se encienda aunque otro proceso lo llame.
    #
    # - sudo systemctl mask <nombre-del-servicio>
    # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    

    # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # Este proceso se ejecutara con procesos basicos que un servidor no utilizara de manera normal.
    #
    # Ejemplo:
    #
    # - bluetooth.service (Gestion de dispositivos Bluetooth [mask]).
    # - cups.service (Es un servicio para servidores de impresoras [stop + disabñe]).
    # - avahi-daemon.service (Permite Descubrir otros dispositivos en redes locales [stop + disable]).
    # - ModemManager.service (Gestiona conexiones de internet por modem [mask]).
    # - postfix.service (Es un servicio para servidores de correos[stop + disable]).
    #
    # Algunos servicios son necesarios para un servidor, asi que para ser generales
    # unicamente se apagaran y no se enmascararan por terminos de usabilidad.
    #
    # Pero esos ejemplos que mostre son los basicos que se ejecutaran, después se hara
    # una busqueda activa para detener y desactivar servicios que simplemente no se utilizen.
    # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    

}


main () {
    if [ "$EUID" -ne 0 ]; then
        echo -e "\e[1;31>> Porfavor Ejecutar el Programa con 'sudo'...\e[0m"
        exit 1
    fi
}

main


