# Use an official Python runtime as a parent image
FROM debian:stable-slim

WORKDIR /app

COPY hhrepid_64 /usr/local/bin/
RUN chmod +x /usr/local/bin/hhrepid_64

ENTRYPOINT ["/usr/local/bin/hhrepid_64"]
