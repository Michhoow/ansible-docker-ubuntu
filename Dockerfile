FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y openssh-server sudo python3 && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash ansible && \
    echo 'ansible:ansible' | chpasswd && \
    echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible && \
    chmod 440 /etc/sudoers.d/ansible

RUN mkdir -p /run/sshd && \
    sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
