FROM debian:wheezy
#Created by Jonathan Ferraro, email below
MAINTAINER jf0108a@gmail.com

#Update to latest version of Debian, Install MySQL
RUN apt-get update && \
    apt-get -yq install mysql-server && \
    apt-get -y install nano

#Open remote access to MySQL
RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

#Mount MySQL dumps to container
VOLUME ["/image-dumps"]
COPY ["/local-dumps", "/image-dumps"]

#Copy run script in to image and authorize script in Debian
COPY ["/mysqlconfig/my.cnf", "/etc/mysql/my.cnf"]

#Copy run script in to image and authorize script
COPY run.sh /tmp/mysql_run.sh
RUN chmod +x /tmp/mysql_run.sh

#Expose port 3306 on the image for remote access
EXPOSE 3306

#Entrypoint script to run initialization MySQL commands
ENTRYPOINT ["/tmp/mysql_run.sh"]
