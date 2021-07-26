#!/bin/sh

if [ SSL == "no" ]; then
  HTTPS_PORT=0
else
  HTTPS_PORT=4041
fi
#echo $CONTEXT_PATH
#echo $HTTPS_PORT

addgroup -g ${GID} subsonic && adduser -h /subsonic -s /bin/sh -D -G subsonic -u ${UID} subsonic

mkdir -p /config/transcode

if [ ! -e /config/transcode/ffmpeg ]; then
  ln -s /usr/bin/ffmpeg /config/transcode/ffmpeg
fi
if [ ! -e /config/transcode/lame ]; then
  ln -s /usr/bin/lame /config/transcode/lame
fi

chown -R subsonic:subsonic /config

sleep 10 # avoid errors

# stop subsonic calling home
echo 127.0.0.1 subsonic.org >> /etc/hosts

su subsonic << EOF
java -Xmx${JVM_MEMORY}m \
  -Dsubsonic.home=/config \
  -Dsubsonic.host=0.0.0.0 \
  -Dsubsonic.port=4040 \
  -Dsubsonic.httpsPort=$HTTPS_PORT \
  -Dsubsonic.defaultMusicFolder=/media \
  -Dsubsonic.defaultPodcastFolder=/podcasts \
  -Dsubsonic.defaultPlaylistFolder=/playlists \
  -Dsubsonic.contextPath=$CONTEXT_PATH \
  -Djava.awt.headless=true \
  -verbose:gc \
  -jar subsonic-booter-jar-with-dependencies.jar
EOF
