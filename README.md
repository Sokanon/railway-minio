# MinIO

One-click deploy of [MinIO](https://min.io/) on Railway -- high-performance, S3-compatible object storage.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/template/TEMPLATE_CODE)

## What's Included

- **MinIO Server** -- S3-compatible object storage with web console
- **Persistent volume** -- stored objects survive redeployments

## Ports

| Port | Purpose |
|------|---------|
| `9000` | S3 API endpoint |
| `9001` | Web console |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `MINIO_ROOT_USER` | Admin username | Auto-generated |
| `MINIO_ROOT_PASSWORD` | Admin password | Auto-generated |
| `MINIO_CONSOLE_ADDRESS` | Console bind address | `:9001` |

## Post-Deployment

1. Generate a public domain for the service to access the web console
2. Open `https://<your-domain>` (routes to port 9001 console by default)
3. Log in with `MINIO_ROOT_USER` and `MINIO_ROOT_PASSWORD`
4. Create buckets and upload files

## Connecting from Other Services

Use Railway's private networking for S3-compatible access:

```
S3_ENDPOINT=http://${{MinIO.RAILWAY_PRIVATE_DOMAIN}}:9000
S3_ACCESS_KEY=${{MinIO.MINIO_ROOT_USER}}
S3_SECRET_KEY=${{MinIO.MINIO_ROOT_PASSWORD}}
S3_BUCKET=my-bucket
S3_REGION=us-east-1
```

## Volume

Data is persisted at `/data`. This includes all buckets, objects, and MinIO configuration.

## Links

- [MinIO Documentation](https://min.io/docs/minio/container/index.html)
- [S3 API Compatibility](https://min.io/docs/minio/linux/reference/s3-api-compatibility.html)
- [Source Code](https://github.com/minio/minio)
