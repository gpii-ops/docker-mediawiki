## Mediawiki Dockerfile


This repository is used to build [Mediawiki](https://www.mediawiki.org) Docker images.


### Environment Variables

* SERVER_NAME

### Port(s) Exposed

* `8080 TCP`


### Base Docker Image

* [inclusivedesign/php](https://github.com/idi-ops/docker-php/)


### Volumes

* /var/www/wiki/images/

### Download

    docker pull gpii/rbmm-java


#### Run `rbmm-java` (RuleBased MatchMaker Java WS)


```
docker run \
-d \
-p 8080:8080 \
--name="rbmm-java" \
inclusivedesign/rbmm-java
```


### Build your own image

    docker build --rm=true -t <your name>/rbmm-java .
