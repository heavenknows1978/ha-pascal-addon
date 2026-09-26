#!/bin/sh
set -e

node /app/apps/editor/server.js &

CERT_DIR=/data/tls
mkdir -p "$CERT_DIR"
if [ ! -f "$CERT_DIR/cert.pem" ]; then
  openssl req -x509 -newkey rsa:2048 -nodes \
    -keyout "$CERT_DIR/key.pem" -out "$CERT_DIR/cert.pem" \
    -days 3650 -subj "/CN=pascal-editor.local"
fi

mkdir -p /etc/stunnel
cat > /etc/stunnel/stunnel.conf << EOF
pid = /tmp/stunnel.pid
foreground = yes
[pascal]
accept = 3443
connect = 127.0.0.1:3000
cert = $CERT_DIR/cert.pem
key = $CERT_DIR/key.pem
EOF

exec stunnel /etc/stunnel/stunnel.conf
