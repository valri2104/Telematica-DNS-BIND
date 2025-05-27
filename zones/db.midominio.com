$TTL 604800
@   IN  SOA midominio.com. root.midominio.com. (
            2         ; Serial
            604800    ; Refresh
            86400     ; Retry
            2419200   ; Expire
            604800 )  ; Negative Cache TTL

@       IN  NS      midominio.com.
@       IN  A       192.168.1.10
www     IN  A       192.168.1.10
