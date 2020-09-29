FROM alpine

ARG USER=app
ENV HOME /home/$USER
ENV REPLICAS 0

RUN adduser -D foo && \
  apk add --no-cache curl bash && \
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

# install sudo as root
RUN apk add --update sudo

# add new user
RUN adduser -D $USER \
  && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
  && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

COPY . . 

ENTRYPOINT ["./execute.sh"]