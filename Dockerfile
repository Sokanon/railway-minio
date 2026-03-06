FROM minio/minio:latest

ENV MINIO_CONSOLE_ADDRESS=":9001"

CMD ["server", "/data"]
