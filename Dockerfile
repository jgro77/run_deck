FROM alpine

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    vim \
    openssh \
    && rm -rf /var/cache/apk/*

RUN pip install awscli

COPY start_stop.sh /etc/profile.d/
COPY cron_job /etc/crontabs/

CMD ["/usr/sbin/crond", " && ", "/usr/sbin/sshd" ] 




