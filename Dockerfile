FROM ubuntu

# File Author / Rafael R. Benetti, Vinicius Alonso
MAINTAINER goku

# Update the repository sources list
RUN apt-get update

# Install and run apache
RUN apt-get install -y apache2 && apt-get clean

#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]


#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2

RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf

RUN a2enconf fqdn

EXPOSE 80
CMD apachectl -D FOREGROUND
#echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
# sudo a2enconf fqdn
