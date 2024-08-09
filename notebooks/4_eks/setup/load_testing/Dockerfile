FROM --platform=linux/amd64 locustio/locust:latest

WORKDIR /mnt/locust

EXPOSE 8089

COPY locust.py locust.py

ENTRYPOINT [ "locust" ]
CMD [ "-f", "locust.py"]
