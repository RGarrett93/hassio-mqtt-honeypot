FROM ghcr.io/home-assistant/base:latest

# install pre-reqs
RUN apk update \
    && apk add --no-cache \
       openssl \
       python3

# create directories and copy app files
WORKDIR /usr/src/app
COPY run.sh honey.py ./

# ensure run.sh is executable
RUN chmod a+x run.sh

# start the honeypot
CMD ["/usr/src/app/run.sh"]
