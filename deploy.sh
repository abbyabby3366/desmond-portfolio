#!/usr/bin/env bash
# Deploy the portfolio to desmond.neuron.my (nginx box 172.236.152.141).
# Static files only: rsync, chown, reload is not needed because nginx serves from disk.
set -euo pipefail

HOST="root@172.236.152.141"
KEY="$HOME/.secrets/ssh/white"
DEST="/var/www/desmond.neuron.my"
SRC="$(cd "$(dirname "$0")" && pwd)"

echo "==> syncing $SRC to $HOST:$DEST"
rsync -az --delete \
  -e "ssh -i $KEY -o StrictHostKeyChecking=no" \
  --exclude '.git' --exclude 'deploy.sh' \
  "$SRC/" "$HOST:$DEST/"

echo "==> fixing permissions"
ssh -i "$KEY" -o StrictHostKeyChecking=no "$HOST" \
  "chown -R www-data:www-data $DEST && find $DEST -type d -exec chmod 755 {} \; && find $DEST -type f -exec chmod 644 {} \;"

echo "==> verifying"
curl -s -o /dev/null -w "https://desmond.neuron.my/ -> %{http_code}\n" https://desmond.neuron.my/
