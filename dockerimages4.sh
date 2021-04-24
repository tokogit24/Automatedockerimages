#!/bin/bash
#Script to build a docker images without mistake.
#Author Rodrigue
#Date April 2021

D=Dockerfile
IND=index.html
c=centos
U=ubuntu
H=httpd
echo "Please select an image"
read i
echo "Please select the version/tags"
read v
if [ ${i} = centos ];
then
echo "<h1> This is my script to build docker images" > $IND
echo "FROM centos:$v" >> $D
echo "MAINTAINER Rodrigue" >> $D
echo "EXPOSE 80" >> $D
echo "COPY ./index.html /var/www/html" >> $D
echo "CMD apachectl -D FOREGROUND" >> $D
docker build -t $i:$v .
elif [ ${i} = ubuntu ];
then
echo "FROM ubuntu:$v" >> $D
echo "MAINTAINER Rodrigue" >> $D
echo "apt-get update -y"
echo "EXPOSE 80" >> $D
echo "COPY ./index.html /var/www/html" >> $D
echo "CMD apachectl -D FOREGROUND" >> $D
docker build -t $U:$v .
elif [ ${i} = httpd ];
then
echo "FROM httpd:$v" >> $D
echo "MAINTAINER Rodrigue" >> $D
echo "RUN apt-get update -y" >> $D
echo "COPY ./index.html /usr/local/apache2/htdocs/" >> $D
docker build -t $H:$v .
else
echo "choose a correct images"
fi

if [ $? -eq 0 ]
then
rm -f $D
fi
sleep 2
echo "Thank you for your business"
sleep 2
echo "Enjoy your image"