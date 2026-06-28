FROM ubuntu:latest


ENV DEBIAN_FRONTEND=noninteractive
#Install Packet (Actualiza los paquetes instalados, actualiza las listas disponibles, Instala servidor ssh, borra caché)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openssh-server  iputils-ping && \ 
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/sshd

#Crea Usuario y configuración de la clave pública ssh desde el contenedor, da permisos
RUN useradd -m -s /bin/bash remote_user && \
    echo 'remote_user:123' | chpasswd && \
    mkdir -p /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh && \
    chown -R remote_user:remote_user /home/remote_user/.ssh

#Copia la clave pública desde el contendor"
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

#Dar persmisos al usuario remoto
RUN chown remote_user:remote_user -R /home/remote_user && \
    chmod 600 /home/remote_user/.ssh/authorized_keys && \
    chmod 700 /home/remote_user/.ssh

#inicia el demon ssh -D ejecuta en primer plano, -e Envia logs
CMD ["/usr/sbin/sshd", "-D", "-e"]

#Este contendor permite conexiones de ssh remotas usando tanto autenticación de clave pública como por contraseña de usuario.

