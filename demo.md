---
title: Blog-Demo
date: 2018-08-25 06:46:35
tags:
---

This demo is running hexo-server as a service. Hexo info is [here](https://hexo.io/).

### Start
```bash
$ docker run -it --rm -p 4000:4000 zhouzhou606/hexo
```
Check the page with loaclhost:4000.

### Mount mds from host
```bash
$ docker run -it --rm -p 4000:4000 -v ${HOST_POSTS}:/blog/source/_posts zhouzhou606/hexo
```

### Notice
Remember to add blog info before md-s.
```
---
title: new-title
date: 2018-08-26 06:46:35
tags:
---
``` 
