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

    docker pull gpii/mediawiki


#### Run `mediawiki` (Mediawiki)


```
docker run \
-d \
-p 8081:80 \
--name="mediawiki" \
-e "SERVER_NAME=wiki.test.org" \
-v $PWD/data/images:/var/www/wiki/images/ \
gpii/mediawiki
```

### Build your own image

The build system takes the mediawiki source stored in `data` directory.

    docker build --rm=true -t <your name>/mediawiki .
