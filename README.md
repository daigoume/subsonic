Subsonic Alpine docker image 
============================

**Application**

[Subsonic](http://http://www.subsonic.org)

**Application description**

Subsonic is a web-based media streamer and jukebox Server. 
Based on Java technology, Subsonic runs on most platforms,
including Windows, Mac, Linux, OSX, and Unix variants.

**Build notes**

Latest release of Subsonic 6.1.6 with alpine:edge

**Usage**

- chech it really works with log dumps by

```
docker-compose up
```

- or silently by

```
docker-compose up -d
```

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

- You can add another music directory by adding another media path (like `/media2` in the above example).
- Do not forget to add the path that you added above into [Settings] > [MEDIA FOLDERS] in the Subsonic web interface.

**Force SSL(https)**

Redirect to https is forced by default. You can switch off this feature by editing `docker-compose.yml` as follows:

```diff
  environment:
-    - SSL=yes
+    - SSL=no
```

**Access application**

[`http://localhost:4040`](http://localhost:4040)

```
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
