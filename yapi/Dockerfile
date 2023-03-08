FROM afreto/debian
LABEL maintainer="afreto@kong5664546498@gmail.com"
# RUN apt-get  update
RUN apt-get install npm -y
RUN npm install -g yapi-cli --registry https://registry.npm.taobao.org
EXPOSE 80
EXPOSE 443
CMD [ "yapi server" ]

# docker build . --build-arg "HTTP_PROXY=http://127.0.0.1:1087/" --build-arg "HTTPS_PROXY=http://127.0.0.1:1087/"  --network host -t debian:1