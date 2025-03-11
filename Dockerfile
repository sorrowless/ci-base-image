ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM cruizba/ubuntu-dind:${DOCKER_VERSION}
ARG HADOLINT_VERSION=${HADOLINT_VERSION}

RUN apt update
RUN apt install -y bash git curl python3-pip python3-dev libffi-dev libssl-dev gcc libc-dev cargo make jq python3-requests python3-urllib3
RUN sed -i '/^root/s/ash/bash/' /etc/passwd
RUN wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64
RUN chmod +x /bin/hadolint

COPY . .
RUN pip3 install --break-system-packages -r requirements.txt -r requirements_extra.txt --no-cache-dir

CMD ["/bin/bash"]
