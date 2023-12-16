# Use the official httpd base image from Red Hat Universal Base Image (UBI)
FROM quay.io/centos7/httpd-24-centos7

ENV DOCROOT /var/www/html

# Set the working directory
WORKDIR ${DOCROOT}

# Create the index.html file with content
RUN echo "Hello, container!" > index.html && ls /var/www/html && chmod 777 /var/www/html

# Expose port 80
EXPOSE 80

# Set labels for OpenShift
LABEL version="1.0" \
      description="This is a Containerfile" \
      Maintainer="Red Hat Training <training@redhat.com>"

ONBUILD COPY /src ${DOCROOT}

# Start the httpd service
CMD ["httpd", "-D", "FOREGROUND"]
