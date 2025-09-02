# Parcial 1 – Servicios Telemáticos (DNS + Apache/PAM + Ngrok)
## Contenido
- maestro/apache/archivos.conf — sitio protegido con PAM (pwauth)
- maestro/apache/denied_users — lista negra PAM
- maestro/apache/pam_pwauth — configuración PAM usada por pwauth
- maestro/bind/named.conf.local — definición de zonas (maestro)
- maestro/bind/db.empresa.local — zona directa
- maestro/bind/db.192.168.50 — zona inversa
- esclavo/bind/named.conf.local — definición de zonas (esclavo)
- esclavo/bind/*.slave — archivos replicados en /var/lib/bind (opcional)
- cliente/50-vagrant.yaml — DNS del cliente hacia el esclavo
- cliente/pruebas_dns.sh — script de verificación

## Cómo probar rápido
1) Cliente usa 192.168.50.4 como DNS (ver `resolvectl status`).
2) `dig maestro.empresa.local @192.168.50.4 +short`
3) `dig -x 192.168.50.3 @192.168.50.4 +short`
4) Detener bind9 en maestro y repetir (continúa resolviendo desde esclavo).
5) Publicación web: ngrok http 80 → abrir `/pagina_personalizada.html`.
