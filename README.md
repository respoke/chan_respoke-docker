# chan_respoke-docker
Dockerfile for building a working Asterisk installation with the chan_respoke channel driver.

This Dockerfile currently builds Debian "jessie" release with pjsip and Asterisk 13 with the 
latest chan_respoke channel driver.

## usage

To build this image, just clone this repo and build using docker:

    git clone https://github.com/chadxz/chan_respoke-docker.git
    cd asterisk-docker
    docker build -t chan_respoke .

More often though, you'll want to use the image built by this repo as a base for your 
own image that needs Asterisk with chan_respoke. This repo is linked to the Docker hub at 
[chadxz/chan_respoke][], so you can simply add this to the top of your own Dockerfile. An 
example extension from this docker image:

    FROM chadxz/chan_respoke:13
    COPY configs/* /usr/etc/asterisk/

The tags follow the version of Asterisk used. Other tags available besides `13` are 
`latest`, `13.5`, and `13.5.0`.

## license

[MIT](https://github.com/chadxz/chan_respoke-docker/blob/master/LICENSE)

[chadxz/chan_respoke]: https://hub.docker.com/r/chadxz/chan_respoke/

