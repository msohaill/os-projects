FROM gcc:latest

WORKDIR /projects

RUN apt-get update && apt-get install -y fuse libfuse-dev

COPY shell/ shell/
COPY scheduler/ scheduler/
COPY filesystem/ filesystem/

CMD ["bash"]