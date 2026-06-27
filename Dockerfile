FROM nextcloud:apache

RUN apt update \
  apt install ffmpeg imagemagick ghostscript
