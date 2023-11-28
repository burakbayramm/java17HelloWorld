FROM jenkins/ssh-slave:jdk11

# Make sure the package repository is up to date.
RUN apt-get update && \
    apt-get install git -qy
