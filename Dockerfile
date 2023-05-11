# get into a shell (root) with
#   docker exec -it --user 0 {container_id} bash
#


FROM --platform=linux/amd64 ubuntu:20.04

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata


# general tooling

RUN apt-get update \
  && apt-get install -y ssh \
        locales \
        ca-certificates \
        curl \
        git \
        sudo \
        vim \
  && apt-get clean


# stuff for C++ dependencies

RUN apt-get update \
  && apt-get install -y g++ \
        cmake \
        make \
        build-essential \
        zlib1g-dev \
        libssl-dev \
  && apt-get clean


# stuff for R and RStudio

#RUN apt-get update \
#  && apt-get install -y r-base \
#	gdebi-core \
#  && apt-get clean

#RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2023.03.0-386-amd64.deb
#RUN sudo gdebi -y rstudio-server-2023.03.0-386-amd64.deb