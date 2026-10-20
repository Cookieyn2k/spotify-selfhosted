#!/bin/sh
echo "[1/4] Garantindo o motor Node.js no contentor..."
docker exec -u root explo apk add --no-cache nodejs 2>/dev/null
echo "[2/4] Corrigindo quebras de linha do cookies..."
sed -i "s/\r$//" /home/rafael/spotify-selfhosted/explo/config/cookies.txt
echo "[3/4] Baixando, convertendo e embutindo capas nas músicas..."
docker exec explo ./explo --config /opt/explo/.env --playlist weekly-exploration --download-mode skip 2>/dev/null || true
docker exec explo yt-dlp --js-runtimes node --cookies /opt/explo/cookies.txt -P /downloads -x --audio-format m4a --embed-thumbnail --add-metadata --max-filesize 50m "ytsearch25:TV Girl Laufey Clairo Indie Audio"
echo "[4/4] Atualizando a biblioteca do Navidrome..."
docker exec navedrome /app/navidrome scan --full 2>/dev/null || true
echo "Processo finalizado com capas e metadados!"
