FROM gitlab/gitlab-runner:ubuntu-v17.0.0

COPY ./filesystem /.
COPY ./filesystem-shared-ca-certificates /.

RUN bash /mnt/pre-install.sh
RUN bash /mnt/setup-ca.sh
RUN bash /mnt/install-jdk.sh

ARG _GIT_USERNAME
ENV GIT_USERNAME=${_GIT_USERNAME}

ARG _GIT_DOMAIN
ENV GIT_DOMAIN=${_GIT_DOMAIN}

ARG _GIT_TOKEN
ENV GIT_TOKEN=${_GIT_TOKEN}

RUN bash /mnt/install-git.sh

ENV GIT_USERNAME="" \
    GIT_TOKEN="" \
    GIT_DOMAIN=""
