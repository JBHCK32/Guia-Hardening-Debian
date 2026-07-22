# Basic Configuration Automation for Debian Servers.

---

## Description:

This project is aimed at Linux servers, specifically the Debian distribution.
It is a set of scripts and programs written in C that automates the basic configuration
of a server with its policies, removal of unused services, detection of open
ports that may be vulnerable, and basic firewall configuration. There is a script that does all
of this in a customized way, obtaining user input through the terminal.

It does not plan to be large, but it is functional and automates server configuration,
making it accessible and guided step by step.

---

## Requirements:

- **System:** Debian (version 11 or higher)
- **Permissions:** Root or sudo
- **Dependencies:** gcc, make, ufw/iptables

---

## Documentation:

There are two places in the project to consult the documentation. `src/` serves
to consult specific documentation about manuals and guides on how the code performs
the basic configuration of each thing. It also gives examples of a basic and secure
configuration to use as a reference.

In `docs/` there is a summary of everything discussed in `src/`, and also a slightly
less technical and more high-level overview than `src/`, which is more specific
about each thing.

---

### Spanish:

# Automatización De Configuración Basica Para Servidores Debian.

---

## Descripción:

Este proyecto va dirigido a servidores Linux, especificamente la distribución de Debian.
Es un conjunto de scripts y programas hechos en C que automatiza la configuración Básica
de un servidor con sus politicas, eliminación de servicios sin utilizar, Detección de Puertos
Abiertos que sean vulnerables y configuración basica de un firewall, existe el script que hace todo
esto de manera personalizada obteniendo el input del usuario mediante la entrada de terminal.

No planea ser grande, pero si funcional y que automatice la configuración de servidores
haciéndola accesible y guiada paso a paso.

---

## Requisitos:

- **Sistema:** Debian (versión 11 o superior)
- **Permisos:** Root o sudo
- **Dependencias:** gcc, make, ufw/iptables

---

## Documentación:

Existen dos lugares en el proyecto para consultar la documentación, src/ sirve
para consultar documentación especifica sobre manuales y guias de como hace el codigo
la configuración basica de cada cosa, tambien da ejemplos de una configuración basica
y segura para que se tome de referencia.

En docs/ esta el resumen de todo lo que se habla en src/ y de paso tambien
un poco menos tecnico y más por encima que src/ que es más especifica en cada
cosa.

---


