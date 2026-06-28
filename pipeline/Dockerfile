FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv \
    ca-certificates \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

ENV ANSIBLE_VENV=/ansible_venv

RUN mkdir $ANSIBLE_VENV && \
    chown jenkins:jenkins $ANSIBLE_VENV

USER jenkins

RUN python3 -m venv $ANSIBLE_VENV && \
    $ANSIBLE_VENV/bin/pip3 install ansible

ENV PATH=$PATH:$ANSIBLE_VENV/bin

USER root

RUN apt-get update && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y \
    docker-ce-cli \
    docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

USER jenkins