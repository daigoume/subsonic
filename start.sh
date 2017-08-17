#!/bin/sh

addgroup -g ${GID} subsonic && adduser -h /subsonic -s /bin/sh -D -G subsonic -u ${UID} subsonic

mkdir -p /config/transcode

ln -s /usr/bin/ffmpeg /config/transcode/ffmpeg
ln -s /usr/bin/lame /config/transcode/lame

chown -R subsonic:subsonic /config

sleep 10 # avoid errors

# stop subsonic calling home
echo 127.0.0.1 subsonic.org >> /etc/hosts

su subsonic << EOF
java -Xmx${JVM_MEMORY}m \
  -Dsubsonic.home=/config \
  -Dsubsonic.host=0.0.0.0 \
  -Dsubsonic.port=4040 \
  -Dsubsonic.httpsPort=4041 \
  -Dsubsonic.contextPath=/ \
  -Dsubsonic.defaultMusicFolder=/media \
  -Dsubsonic.defaultPodcastFolder=/podcasts \
  -Dsubsonic.defaultPlaylistFolder=/playlists \
  -Dsubsonic.contextPath=/ \
  -Djava.awt.headless=true \
  -verbose:gc \
  -jar subsonic-booter-jar-with-dependencies.jar
EOF
