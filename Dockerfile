FROM sshd

RUN apt-get update && apt-get install -y \
    bzip2 \
    git \
    curl 

ARG user
ARG id

RUN su ${user} -c 'git clone https://github.com/reflex-frp/reflex-platform.git ~/reflex-platform'

