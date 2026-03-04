# Muntim Landing V1 Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build and deploy a standalone static personal landing at `muntim.ru` with placeholder content and a visible link to `https://bloodyssey.muntim.ru/`, served over HTTPS by Caddy in Docker.

**Architecture:** A separate repository contains static assets (`index.html`, `styles.css`) and a containerized Caddy service that serves files and terminates TLS for `muntim.ru`. The existing Bloodyssey repository and deployment remain untouched. A lightweight smoke check script validates that required content is present before deployment.

**Tech Stack:** Static HTML/CSS/JS, Caddy 2, Docker Compose, Bash smoke checks

---

### Task 1: Bootstrap standalone repository structure

**Files:**
- Create: `README.md`
- Create: `.gitignore`
- Create: `docker-compose.yml`
- Create: `Caddyfile`
- Create: `site/index.html`
- Create: `site/styles.css`
- Create: `site/app.js`

**Step 1: Write the failing smoke expectation first**

Create minimal placeholder `site/index.html` without Bloodyssey link so validation can fail intentionally.

**Step 2: Run check to verify it fails**

Run: `rg "https://bloodyssey.muntim.ru/" site/index.html`
Expected: no matches (non-zero exit code)

**Step 3: Write minimal implementation to pass structure baseline**

Populate all listed files with minimal valid content:
- Caddy serves `/srv` and enables TLS for `muntim.ru`.
- Compose mounts `./site` and `./Caddyfile` into Caddy container.
- `README.md` explains run/deploy commands.

**Step 4: Re-run baseline checks**

Run:
- `docker compose config`
- `test -f site/index.html && test -f Caddyfile && test -f docker-compose.yml`

Expected: compose config renders successfully; file checks pass.

**Step 5: Commit**

```bash
git add README.md .gitignore docker-compose.yml Caddyfile site/index.html site/styles.css site/app.js
git commit -m "chore: bootstrap standalone personal landing with containerized caddy"
```

### Task 2: Implement landing layout and required Bloodyssey link

**Files:**
- Modify: `site/index.html`
- Modify: `site/styles.css`
- Modify: `site/app.js`
- Create: `scripts/smoke-check.sh`

**Step 1: Write the failing test**

Create `scripts/smoke-check.sh` that fails unless all are true:
- page contains `https://bloodyssey.muntim.ru/`
- page contains sections: `Hero`, `Projects`, `About`, `Contacts`
- page contains placeholder text `Lorem ipsum`

Initial script should run against current `site/index.html` and fail.

**Step 2: Run test to verify it fails**

Run: `bash scripts/smoke-check.sh`
Expected: FAIL with explicit message about missing required content.

**Step 3: Write minimal implementation**

Update landing markup and styles:
- responsive single-page layout;
- project card for Bloodyssey with link to `https://bloodyssey.muntim.ru/`;
- lorem ipsum placeholders for all other content;
- simple filter buttons (`All`, `Personal`, `Team`) with minimal JS in `site/app.js`.

**Step 4: Run test to verify it passes**

Run: `bash scripts/smoke-check.sh`
Expected: PASS (`Smoke checks passed`).

**Step 5: Commit**

```bash
git add site/index.html site/styles.css site/app.js scripts/smoke-check.sh
git commit -m "feat: add responsive personal landing with bloodyssey showcase link"
```

### Task 3: Validate containerized local HTTPS-ready serving

**Files:**
- Modify: `README.md`
- Modify: `Caddyfile`

**Step 1: Write the failing runtime check**

Add a local verification command to README that expects Caddy container to become healthy and serve index content.

**Step 2: Run check to verify current state fails or is incomplete**

Run:
- `docker compose up -d`
- `docker compose ps`
- `docker compose logs caddy --tail=100`

Expected (before final tuning): either missing clarity or missing host mapping detail in docs.

**Step 3: Write minimal implementation**

Finalize Caddy + docs:
- Caddyfile includes `muntim.ru` site block and static root config.
- README includes exact commands for local run, stop, and deployment notes (DNS A record to server, ports 80/443 open).

**Step 4: Run verification**

Run:
- `docker compose up -d`
- `curl -I http://localhost`
- `curl -s http://localhost | rg "bloodyssey.muntim.ru"`

Expected: caddy is up; HTTP response is returned; Bloodyssey link is present in served HTML.

**Step 5: Commit**

```bash
git add README.md Caddyfile
git commit -m "docs: document caddy https deployment and local runbook"
```

### Task 4: Final pre-deploy verification and handoff

**Files:**
- Modify: `README.md`

**Step 1: Write failing release checklist**

Add release checklist section to README with unchecked items (DNS, firewall, compose up, smoke check).

**Step 2: Run checks to identify missing data**

Run:
- `bash scripts/smoke-check.sh`
- `docker compose config`

Expected: if any mismatch exists, checklist remains incomplete.

**Step 3: Write minimal implementation**

Complete README handoff with copy-paste commands:
- `docker compose pull`
- `docker compose up -d --force-recreate`
- post-deploy checks for `https://muntim.ru`.

**Step 4: Re-run checks**

Run:
- `bash scripts/smoke-check.sh`
- `docker compose config`

Expected: both pass cleanly.

**Step 5: Commit**

```bash
git add README.md
git commit -m "chore: add release checklist and deployment verification steps"
```
