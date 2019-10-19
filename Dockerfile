FROM python:3.7-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.opencontainers.image.title="org-c7n" \
      org.opencontainers.image.authors="Brian Dwyer <bdwyertech@github.com>" \
      org.opencontainers.image.source="https://github.com/bdwyertech/docker-org-c7n.git" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.created=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/bdwyertech/docker-org-c7n.git"

ADD requirements.txt .
RUN apk --no-cache add bash git \
    && python -m pip install --upgrade pip \
    && python -m pip install --upgrade pipenv \
    && python -m pip install -r requirements.txt \
    && rm requirements.txt \
    && rm -rf ~/.cache/pip

ENTRYPOINT ["/bin/bash"]
