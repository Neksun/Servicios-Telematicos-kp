set -e
echo "== DNS cliente =="
resolvectl status | sed -n '/DNS Servers/,+2p'
echo
echo "== Consultas al ESCLAVO (.4) =="
dig maestro.empresa.local @192.168.50.4 +short
dig www.empresa.local     @192.168.50.4 +short
dig -x 192.168.50.3       @192.168.50.4 +short
echo
echo "== Ping por nombre (usa DNS configurado) =="
ping -c 2 maestro.empresa.local || true
