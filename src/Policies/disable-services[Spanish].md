# Desiciones tomadas en la elección de deshabilitación de servicios.

---

# Lista de Servicios

Expliquemos primer la lista de servicios, todos estos servicios que aparecen encima
del script 'clean-services.sh' como comentario es para dejar una vista global con los
servicios que interactua el script.

---

## Avahi-daemon | avahi-daemon.service:

Este servicio permite que los demás en tu red local detecte tus servicios.
Tienes varias funciones y protocolos como:

- mDNS: Permite la resolución de direcciones IP sin un servidor DNS central.
- DNS-SB: Permite a los servicios "enunciarse" en la red y los clientes "descubrirlos".

Son funciones utiles que sin mentirte se pueden llegar a usar en un servidor.
El caso esta en que aqui la desición que se toma con este servicio es unicamente apagarlo
y desactivarlo, se deja de esa manera al ser algo util pero se le recomienda al usuario
eliminarlo si su servidor tiene otro tipo de utilidades.

En este caso la desición que tome al diseñar el script 'clean-services.sh' fue
simplemente desactivarlo como medida estandar y dejar que el usuario lo elimine
o lo use si lo desea y necesita.

Además se desactiva y me parece imposible de usar especificamente por la configuración
de reglas en el firewall donde para usar este servicio se necesita un multicast en el puerto
5353, lo cual hace fricción con las reglas establecidas y explicadas en `firewall-conf[Spanish].md`.

Si quieres usar avahi tendrias que tener encuenta esas trabas para usar el servicio
y tu mismo configurar el firewall ya que el script esta hecho de esa manera o 
cambiar tu mismo el script de configuración del firewall y permitir el uso del puerto
5353 para poder usar avahi de manera comoda.


## CUPS	| cups.service:

CUPS es un servicio de gestion de impresiones es muy util para un servidor de impresoras
por sus multiples utilidades:

- Permite conectar y configurar impresoras conectadas directamente por USB o a través de la red.
- CUPS puede configurar impresoras modernas sin necesidad de instalar controladeres especificos del fabricante. 
- Ofrece una herramienta de configuración gráfica a la que se accede desde el navegador en http://localhost:631/, lo que facilita enormemente la gestión.

Puede llegar a ser muy util para la gestion de impresoras, pero tiene algunos matices...
El primero es que choca con las politicas de nuestar configuración de firewall en el archivo `firewall-conf[Spanish].md`,
por lo tanto tu mismo tendrias que modificar el firewall si deseas usar este servicio y permitir trafico por el puerto 631(TCP).

El segundo es que en la gestion de impresoras con al parte web no serviria en un servidor sin entorno
grafico que es hacia el publico que va dirigido el DebFort.

Al final es un servicio que se dejo en desactivado por ser un muy buen gestor de impresoras
pero ya esta en opción del usuario si activarlo para usarlo o eliminarlo dependiendo del 
uso que vaya a tener su servidor.

Lo deje en desactivado porque el hardening que hace DebFort es para un servidor basico
que quiere tener una buena base para empezar a añadir lo que necesite.

## RPC / Portmap | rpcbind.service / portmap.service:

Estos dservicios representados en Debian moderno por `rpcbind.service` y en versiones antiguas como `portmap.service`
este servicio sirve para traducri números de programa RCP a direcciones IP y numeros de puerto de red(TCP/UDP). Sirve
mucho para la gestion de NFS, NIS que ya es muy viejo, apliaciones de estaciones de trabajo antiguas y NAS antigua.

Tiene varias  funciones como:

- la actual `rpcbind` soporta RPC versiones 3 y 4, lo que le permite manejar IPv6, llamadas de procedimiento encriptadas y múltiples protocolos de red.
- `rpcbind` guarda un registro de los servicios registrados en `/var/run/rpcbind/`, de modo que si el demonio se reinicia, los servicios no necesitan volver a registrarse.

Apesar de ser muy util es un peligro de seguridad en el puerto 111 que suele ser un vector de ataque clasico.
Esto de primeras ya choca con al configuración segura del firewall que aplica DebFort, te recomiendo que si lo llegas a usar
configures el firewall y que permitas que solo hosts confiables puedan acceder mediante ese puerto, sino como dije
podria ser un vector de ataque para cuaquier persona con intenciones maliciosas.

Por esas razones se decidio desactivarlo unicamente, en este caso solo se eliminan servicioes realmente
inutiles, pero si lo llegaras a necesitar toma medidas de seguridad y precauciones y listo.

Todo esta en poder del usuario, sino lo llegaras a necesitar entonces solo eliminalo, yo tome la desición de dejar
servicios que llegaran a ser utiles como desactivados para dejarle todo el poder al usuario de hacer lo que necesite sin
mucha fricción.

En resumen, se desactiva por su vulnerabilidad y tambien se desactivan versiones viejas del servicio, no se eliminan del todo por si al usuario
le llegara a ser util y le sea necesario utilizarlo y que no lo tenga que volver a descargar, eso si, se recomienda
el uso de este servicio con seguridad y precauciones por ser una vulnerabilidad latente.

De cualqueir manera DebFort te permite de manera general seleccionar los servicios que quieras eliminar de manera directa por tu descición.

## Fuentes / Infografia:

### Avahi-daemon:
- https://wiki.debian.org/Avahi?action=recall&rev=43
- https://manpages.debian.org/testing/avahi-daemon/avahi-daemon.8.en.html

### CUPS:
- https://manpages.debian.org/bookworm/cups/cups.1.en.html
- https://www.debian.org/doc/manuals/debian-handbook/sect.config-printing.zh-cn.html

### RCP / Portmap:
- https://packages.debian.org/bookworm/rpcbind
- https://manpages.debian.org/testing/rpcbind/rpcbind.8.en.html
