# Mediawiki Dockerfile - Ansible version

Builds a Mediawiki Docker container image. This image is built using the [Ansible role](https://github.com/idi-ops/ansible-php-fpm).

## Building

Build Ansible-provisioned image:
- `docker build --no-cache -t idi/mediawiki .`

### Run Examples

#### Run a container for production

```
docker run \
--name mediawiki_test\
-d \
-p 80:9001 \
-v /mediawiki/source:/var/www
-e NGNIX_DOMAINS="['localhost' , 'test.domain.org']" \
idi/mediawiki
```

