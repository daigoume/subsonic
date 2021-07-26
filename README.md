Subsonic Alpine docker image
============================

**Application**

[Subsonic](www.subsonic.org)

**Application description**

Subsonic is a web-based media streamer and jukebox Server. 
Based on Java technology, Subsonic runs on most platforms,
including Windows, Mac, Linux, OSX, and Unix variants.

**Build notes**

Latest release of Subsonic 6.1.6 with alpine:edge

**Usage**

Check it really works with log dumps by

```
docker-compose up
```

or silently by

```
docker-compose up -d
```

then access to http://localhost:4040 .

**Settings**

Change publish ports by editing `docker-compose.yml` as follows:

```diff
  ports:
-    - `4040:4040`
+    + `[http port]:4040`
-    - `4041:4041`
+   + `[https port]:4041`
```

Add your music directory by editing as follows:

```diff
  volumes:
-    - './music:/media'
+    - '/your/favorite/path:/media'
+    - '/another/path:/media2'
```

- You can add other music directories by adding multiple media paths (like `/media2` in the above example).
- Do not forget to add the paths (`/media`, `/media2` in above example) into [Settings] > [MEDIA FOLDERS] > [ADD MEDIA FOLDER] through the Subsonic web interface.

**Force SSL(https)**

Redirect to https is forced by default. You can switch off this feature by editing `docker-compose.yml` as follows:

```diff
  environment:
-    - SSL=yes
+    - SSL=no
```

**Build**

`docker-compose build ./`

**Docker run command** 

```bash
docker run -d \
    -p 4040:4040 \
    -p 4050:4050 \
    --name=Subsonic \
    -e CONTEXT_PATH=\ \
    -e SSL=yes \
    -v /media/music/:/media \
    -v /apps/docker/Subsonic:/config \
    -v /etc/localtime:/etc/localtime:ro \
    phasmatis/subsonic
```
