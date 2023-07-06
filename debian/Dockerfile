FROM debian:latest
# FROM python:3
# LABEL maintainer="afreto@kong5664546498@gmail.com"
# RUN ["apt-get","upgrade"]
# RUN ["apt-get","update"]
RUN apt-get purge -y python.*
ENV LANG C.UTF-8
ENV GPG_KEY 97FC712E4C024BBEA48A61ED3A5CA953F73C700D
ENV PYTHON_VERSION 3.9.6
ENV PYTHON_PIP_VERSION 23.1.2
RUN ["apt-get","install", "python3","-y"]
RUN ["apt-get","install", "python3-pip"]
RUN ["apt-get","install","openjdk-11-jdk"]

#RUN ["apt-get","install","npm","-y"]
#RUN apt install npm -y
#RUN npm install -g yapi-cli --registry https://registry.npm.taobao.org
#CMD [ "yapi","server" ]
# RUN ["apt-get","install","python3","-y"]
# RUN ["apt","install","python3-pip","-y"]
# RUN ["pipe","install","pipenv"]


#docker build . --build-arg "HTTP_PROXY=http://127.0.0.1:1087/" --build-arg "HTTPS_PROXY=http://127.0.0.1:1087/"  --network host -t debian:1
# docker tag debian:1 afreto/debian:1
# docker push afreto/debian:1
