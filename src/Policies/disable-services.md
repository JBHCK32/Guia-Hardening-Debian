# Decisions made in the choice of service disabling.

---

# Service List

First, let's explain the list of services. All of these services that appear as comments at the top of the `clean-services.sh` script are there to provide a global view of the services with which the script interacts.

---

## Avahi-daemon | avahi-daemon.service:

This service allows others on your local network to discover your services.
It has several functions and protocols, such as:

- mDNS: Allows IP address resolution without a central DNS server.
- DNS-SD: Allows services to "advertise" themselves on the network and clients to "discover" them.

These are useful functions that, to be honest, can be used on a server. However, the decision here is to simply stop and disable this service. It is left this way because it can be useful, but the user is recommended to remove it if their server has different needs.

In this case, the decision I made when designing the `clean-services.sh` script was simply to disable it as a standard measure and let the user remove it or use it if they wish and need it.

Furthermore, it is disabled because I find it practically impossible to use, specifically due to the firewall rules configuration. To use this service, you need multicast traffic on port 5353, which creates friction with the rules established and explained in `firewall-conf.md`.

If you want to use Avahi, you would have to consider these hurdles to use the service and configure the firewall yourself, since the script is designed this way. Alternatively, you could modify the firewall configuration script yourself to allow port 5353 in order to use Avahi comfortably.


## CUPS | cups.service:

CUPS is a printing management service, very useful for a print server due to its multiple utilities:

- Allows connecting and configuring printers connected directly via USB or over the network.
- CUPS can configure modern printers without needing to install manufacturer-specific drivers.
- Offers a graphical configuration tool accessible via a web browser at `http://localhost:631/`, which greatly simplifies management.

It can be very useful for printer management, but it has some nuances...
The first is that it conflicts with our firewall configuration policies, as explained in `firewall-conf.md`. Therefore, you would have to modify the firewall if you wish to use this service and allow traffic on port 631 (TCP).

The second is that the web management interface would not be useful on a server without a graphical environment, which is the target audience for DebFort.

Ultimately, this service was left disabled because it is a very good printer manager, but it is up to the user to activate it for use or remove it, depending on the intended use of their server.

I left it disabled because the hardening that DebFort performs is for a basic server that wants a solid foundation to start adding what it needs.


## RPC / Portmap | rpcbind.service / portmap.service:

These services, represented in modern Debian by `rpcbind.service` and in older versions as `portmap.service`, serve to translate RPC program numbers to IP addresses and network port numbers (TCP/UDP). They are very useful for managing NFS, NIS (which is now very old), legacy workstation applications, and older NAS devices.

It has several functions, such as:

- The current `rpcbind` supports RPC versions 3 and 4, which allows it to handle IPv6, encrypted remote procedure calls, and multiple network protocols.
- `rpcbind` keeps a record of registered services in `/var/run/rpcbind/`, so that if the daemon is restarted, services do not need to re-register.

Despite being very useful, it is a security risk on port 111, which is a classic attack vector.
This, from the outset, conflicts with the secure firewall configuration applied by DebFort. I recommend that if you do use it, you configure the firewall to only allow trusted hosts to access it through that port; otherwise, as I said, it could be an attack vector for anyone with malicious intent.

For these reasons, it was decided to only disable it. In this case, only truly useless services are removed, but if you ever need it, take security measures and precautions, and you're set.

Everything is in the hands of the user. If you don't need it, then just remove it. I made the decision to leave services that could be useful disabled, to give the user full power to do what they need without much friction.

In summary, it is disabled due to its vulnerability, and older versions of the service are also disabled. It is not removed entirely in case the user finds it useful and needs it, so they don't have to download it again. However, it is recommended to use this service with security and precautions, as it is a latent vulnerability.

Either way, DebFort allows you, in a general way, to select the services you want to remove directly, based on your decision.


## Sources / References:

### Avahi-daemon:
- https://wiki.debian.org/Avahi?action=recall&rev=43
- https://manpages.debian.org/testing/avahi-daemon/avahi-daemon.8.en.html

### CUPS:
- https://manpages.debian.org/bookworm/cups/cups.1.en.html
- https://www.debian.org/doc/manuals/debian-handbook/sect.config-printing.zh-cn.html

### RPC / Portmap:
- https://packages.debian.org/bookworm/rpcbind
- https://manpages.debian.org/testing/rpcbind/rpcbind.8.en.html
