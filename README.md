Subsonic Alpine docker image 
============================

**Application**

[Subsonic](http://http://www.subsonic.org)

**Application description**

Subsonic is a web-based media streamer and jukebox Server. 
Based on Java technology, Subsonic runs on most platforms,
including Windows, Mac, Linux, OSX, and Unix variants.

**Build notes**

Latest release of Subsonic.

**Usage**

```
docker run -d \
	-p 4040:4040 \
	-p 4041:4041 \
	--name=<container name> \
	-e CONTEXT_PATH=<root path> \
	-e SSL=<yes|no> \
	-v <path for media files>:/media \
	-v <path for config files>:/config \
	-v /etc/localtime:/etc/localtime:ro \
	phasmatis/subsonic
```

Please replace all user variables in the above command defined by <> with the correct values.

**Access application**

`http://<host ip>:4040`

**Example**

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
