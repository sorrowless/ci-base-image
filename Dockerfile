ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM docker:${DOCKER_VERSION}
ARG HADOLINT_VERSION=${HADOLINT_VERSION}

RUN apk add bash git curl py-pip python3-dev libffi-dev openssl-dev gcc libc-dev rust cargo make jq py3-requests py3-urllib3
RUN sed -i '/^root/s/ash/bash/' /etc/passwd
RUN wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64
RUN chmod +x /bin/hadolint

COPY . .
RUN pip3 install --break-system-packages -r requirements.txt -r requirements_extra.txt --no-cache-dir

CMD ["/bin/bash"]
