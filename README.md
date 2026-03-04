# muntim-site

Static personal landing for `muntim.ru`.

## Local run

```bash
docker compose up -d
docker compose ps
```

Open `http://localhost`.

## Stop

```bash
docker compose down
```

## Smoke checks

```bash
bash scripts/smoke-check.sh
```

## Production notes (HTTPS)

- DNS `A` record for `muntim.ru` (and optionally `www.muntim.ru`) should point to server IP.
- Ports `80` and `443` must be open.
- Caddy container requests and renews TLS certificates automatically.

## Deploy

```bash
docker compose pull
docker compose up -d --force-recreate
bash scripts/smoke-check.sh
```
