# Use an official Python runtime as a parent image
FROM debian:stable-slim

COPY hhrepid_64 /usr/local/bin/
RUN chmod +x /usr/local/bin/hhrepid_64

CMD ["/usr/local/bin/hhrepid_64"]
