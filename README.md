# chan_respoke-docker
Dockerfile for building a working Asterisk installation with the 
[chan_respoke][github/chan_respoke] channel driver.

This Dockerfile currently builds Debian "jessie" release with pjsip and Asterisk 13 with the 
latest chan_respoke channel driver.

## usage

To build this image, just clone the repo and build using docker:

    git clone https://github.com/respoke/chan_respoke-docker.git
    cd asterisk-docker
    docker build -t chan_respoke .

More often though, you'll want to use the image built by this repo as a base for your 
own image that needs Asterisk with chan_respoke. This repo is linked to the Docker hub at 
[respoke/chan_respoke][dockerhub/chan_respoke], so you can simply add this to the top of your 
own Dockerfile. An example extension from this docker image:

    FROM respoke/chan_respoke:13
    COPY configs/* /etc/asterisk/

## using environment variables and templates

The [Asterisk image][github/asterisk-docker] that this Dockerfile is based on looks for 
any Jinja2 templates in `/etc/asterisk/` and processes them, replacing variables with the 
environment variable of the same name. In addition to the environment variable replacements
supported by the default Asterisk template (`DCS_TRUNK_AUTH_USERNAME` and 
`DCS_TRUNK_AUTH_PASSWORD`), this image also allows you to set the Respoke application secret
using the `RESPOKE_APP_SECRET` environment variable:

    docker run -e RESPOKE_APP_SECRET=my_application_secret \
               chan_respoke

If you use this image as the base for your own Dockerfile, you can add Jinja2
templates to the `/etc/asterisk/` directory with the file extension `.j2` and they will
also be processed. See the `conf/respoke.conf.j2` template in this repo for an example, 
and refer to the [Official Jinja2 Template Designer Documentation][] for additional
details on the template syntax.

## repo tags

There are multiple tagged images pushed to Docker Hub corresponding to the base Asterisk
version that chan_respoke has been installed into. The following tags are available:

- `latest` - follows tip of the master tree. The bleeding edge.
- `13` - receives minor and patch updates to Asterisk 13.
- `13.5` - receives patch updates to Asterisk 13.5.
- `13.5.0` - pinned to Asterisk 13.5.0.

## license

[MIT](https://github.com/respoke/chan_respoke-docker/blob/master/LICENSE)

[dockerhub/chan_respoke]: https://hub.docker.com/r/respoke/chan_respoke/
[github/chan_respoke]: https://github.com/respoke/chan_respoke
[github/asterisk-docker]: https://github.com/respoke/asterisk-docker
[Official Jinja2 Template Designer Documentation]: http://jinja.pocoo.org/docs/dev/templates/
