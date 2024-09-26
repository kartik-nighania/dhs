FROM locustio/locust:latest

WORKDIR /mnt/locust
COPY locust.py .

EXPOSE 8089
CMD ["-f", "/mnt/locust/locust.py"]