#!/bin/sh
COOKIES="/home/rafael/spotify-selfhosted/explo/config/cookies.txt"
DESTINO="/home/rafael/spotify-selfhosted/media/music/Explo"

# Força a limpeza de quebras de linha do Windows caso o ficheiro tenha sido alterado
sed -i 's/\r$//' "$COOKIES"

# Exemplo de comando para baixar as faixas utilizando o motor JavaScript ativado
yt-dlp --js-runtimes node --cookies "$COOKIES" -P "$DESTINO" -f bestaudio "https://www.youtube.com/playlist?list=SUA_PLAYLIST_ID"
