FROM binwiederhier/ntfy:v2.11.0

# Install curl for sending requests to LINE servers
RUN apk add --no-cache curl

# Copy the required scripts into the image
COPY subscribe.sh line-notify.sh /usr/local/bin/

ENTRYPOINT ["/bin/sh"]
CMD ["/usr/local/bin/subscribe.sh"]

