# muntim-site

Static personal landing for `muntim.ru`.

## Stack

- Static files: `index.html`, `styles.css`, `app.js`
- Hosting: GitHub Pages
- Domain: `muntim.ru` (custom domain via `CNAME` file)

## Local check

Open `index.html` in browser and run smoke checks:

```bash
bash scripts/smoke-check.sh
```

## GitHub Pages setup

1. Repository -> `Settings` -> `Pages`.
2. `Source`: `Deploy from a branch`.
3. `Branch`: `master` (or `main`), folder: `/ (root)`.
4. Wait until Pages publishes the site.

## DNS for custom domain

- Keep `bloodyssey.muntim.ru` DNS records untouched.
- Point apex domain to GitHub Pages IPs:
  - `185.199.108.153`
  - `185.199.109.153`
  - `185.199.110.153`
  - `185.199.111.153`
- Optional `www` alias:
  - `CNAME` `www` -> `TimurMunykin.github.io`

## HTTPS

- GitHub Pages issues TLS certificate automatically after DNS propagation.
- Then enable `Enforce HTTPS` in Pages settings.

## Required content check

```bash
bash scripts/smoke-check.sh
```
