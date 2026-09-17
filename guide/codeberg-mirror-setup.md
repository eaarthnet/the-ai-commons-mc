# 🌍 Codeberg Mirror — ACTIVE ✅

**Purpose:** Maintain a redundant copy of the EAARTHNET repository on Codeberg (Germany, non-profit) as a break from Microsoft enclosure.

---

## Status: ✅ LIVE & SYNCED

| Remote | URL | Status | Last Commit |
|--------|-----|--------|-------------|
| `origin` (GitHub) | `https://github.com/eaarthnet/the-ai-commons-mc.git` | Primary ✅ | 6501341 |
| `codeberg` | `https://codeberg.org/eaarthnet/the-ai-commons-mc.git` | Mirror ✅ | 6501341 |

**Live URLs:**
- GitHub: https://github.com/eaarthnet/the-ai-commons-mc
- Codeberg: https://codeberg.org/eaarthnet/the-ai-commons-mc

---

## Configuration

```bash
git remote -v
# origin    https://eaarthnet:[TOKEN]@github.com/eaarthnet/the-ai-commons-mc.git
# codeberg  https://eaarthnet:[TOKEN]@codeberg.org/eaarthnet/the-ai-commons-mc.git
```

---

## Manual Sync

When you want to manually sync to Codeberg:

```bash
git push codeberg main --force-with-lease
```

---

## Automation Strategy

### Two-Remote Push Script (Primary Method)

Use `scripts/push-all.sh` (committed to repo):

```bash
#!/bin/bash
# Push to both GitHub and Codeberg simultaneously
echo "Pushing to origin (GitHub)..."
git push origin main || { echo "GitHub push failed"; exit 1; }

echo "Pushing to codeberg..."
git push codeberg main --force-with-lease || { echo "Codeberg push failed"; exit 1; }

echo "✅ Both mirrors synced"

# Verification
ORIGIN_HASH=$(git rev-parse origin/main)
CODEBERG_HASH=$(git rev-parse codeberg/main)

if [ "$ORIGIN_HASH" = "$CODEBERG_HASH" ]; then
    echo "✅ Commit hashes match: $ORIGIN_HASH"
else
    echo "⚠️  WARNING: Divergence detected!"
    echo "    GitHub: $ORIGIN_HASH"
    echo "    Codeberg: $CODEBERG_HASH"
    exit 1
fi
```

**Habit-based automation:** Use `./scripts/push-all.sh` instead of plain `git push`.

### Cron Job (Daily Backstop)

Add to crontab (`crontab -e`):

```bash
# Daily sync check at 02:00 UTC
# CRITICAL: Update PATH to your sovereign disk location when migrated
0 2 * * * cd ~/eaarthnet-mc && git pull origin main && ./scripts/push-all.sh
```

**⚠️ MIGRATION NOTE:** After migrating to sovereign disk, the cron path MUST change from `/mnt/workspace/gh-repo` to your sovereign location (e.g., `~/eaarthnet-mc`). Leaving it pointing at the sandbox guards an abandoned copy.

---

## Why Codeberg?

| Factor | GitHub (Microsoft) | Codeberg (NFG e.V.) |
|--------|-------------------|---------------------|
| Jurisdiction | USA | Germany (GDPR) |
| Profit Status | Public corp | Non-profit |
| Enclosure Risk | High | Low |
| Data Sovereignty | US CLOUD Act | EU Data Protection |
| AI Policy | Embraces LLMs | Restricting autonomous LLM content* |

**Same logic as Matrix bunker diversification.** Different soil = different risk profile.

*\*Note: This repo represents human-curated council work with AI assistance — aligns with "human collaboration with tools" exception in their policy.*

---

## Security Notes

- **Tokens should NOT remain embedded in `.git/config` after migration**
- Use `--force-with-lease` instead of `--force` to protect against accidental overwrites
- Rotate tokens periodically via Settings → Applications
- Delete tokens when no longer needed

### Credential Storage

Preferred order (security > convenience):
1. **gpg-agent** — encrypted, keychain-integrated
2. **pass** — standard Unix password manager
3. **SSH keys** — token-free authentication
4. ❌ **Never `credential.helper store`** — writes plaintext to `~/.git-credentials`

With two webhook incidents on record, take the better option if it doesn't cost you an evening.

---

## Verification Commands

```bash
# Check remotes
git remote -v

# See latest commits on each
git log --oneline origin/main -5
git ls-remote codeberg refs/heads/main

# Compare commit hashes (should match exactly)
echo "origin: $(git rev-parse origin/main)"
echo "codeberg: $(git rev-parse codeberg/main)"

# Quick sync check
if [ "$(git rev-parse origin/main)" = "$(git rev-parse codeberg/main)" ]; then
    echo "✅ Mirrors synchronized"
else
    echo "❌ Divergence detected!"
fi
```

---

## Sovereign Disk Migration Protocol

⚠️ **Current state:** The working repo, embedded tokens, and automation live in the Agnes AI sandbox (/mnt/workspace/gh-repo/). This is cloud platform territory — mortal infrastructure.

**Migration sequence — execute in this exact order, same day:**

### Step 1: Reissue Tokens First
Before touching any copies:
- **GitHub:** Settings → Developer settings → Personal access tokens → Generate new token (scope: `repo`)
- **Codeberg:** Settings → Applications → Generate New Token

Store these securely (password manager or gpg-agent). Do NOT write to `.git-credentials`.

### Step 2: Revoke Old Tokens Immediately
After generating new ones, revoke the old ones:
- **GitHub:** Delete the sandbox-originating token from your list
- **Codeberg:** Delete the sandbox-originating token from your list

This kills the live credentials in the sandbox before you copy anything.

### Step 3: Copy Repo to Sovereign Disk
```bash
# Now safe to copy — old tokens are dead
cp -r /mnt/workspace/gh-repo ~/eaarthnet-mc
cd ~/eaarthnet-mc
```

### Step 4: Update Remote URLs with New Tokens
```bash
git remote set-url origin https://eaarthnet:[NEW_GITHUB_TOKEN]@github.com/eaarthnet/the-ai-commons-mc.git
git remote set-url codeberg https://eaarthnet:[NEW_CODEBERG_TOKEN]@codeberg.org/eaarthnet/the-ai-commons-mc.git
```

### Step 5: Configure Secure Credential Helper
```bash
# Option A: gpg-agent (recommended)
git config --global credential.helper 'cache --timeout=3600'

# Option B: SSH keys (token-free)
git remote set-url origin git@github.com:eaarthnet/the-ai-commons-mc.git
git remote set-url codeberg git@git.codeberg.org:eaarthnet/the-ai-commons-mc.git
```

### Step 6: Scrub Sandbox Copy
Once verified working from sovereign disk:
```bash
rm -rf /mnt/workspace/gh-repo
# Or keep as read-only archive if desired
```

### Step 7: Update Cron Path
```bash
crontab -e
# Change: cd /mnt/workspace/gh-repo
# To:     cd ~/eaarthnet-mc
```

**Timeline:** Same day for Steps 1–4. Step 6 can wait until next working session. **"Within 7 days" is insufficient — this is a live credential exposure.**

---

## Maintenance Schedule

- **Before each push:** Run verification commands to confirm sync
- **Weekly:** Verify both mirrors are in sync
- **Monthly:** Test pull from Codeberg
- **Quarterly:** Full audit of access credentials
- **Immediately:** Revoke any token that may have been exposed

---

## Codeberg Policy Declaration

Per Council decision and Codeberg's Terms of Use (updated 22 Aug 2026):

> *"This repository contains human-curated council work produced through carbon-silicon symbiosis. AI tools assist in drafting and review, but all outputs are reviewed, edited, and committed by a human curator (Neil Netherton). This aligns with Codeberg's exception for 'human collaboration with tools' and does not constitute autonomous LLM-generated content."*

---

## Open Items

| Item | Status | Owner |
|------|--------|-------|
| Webhook revocation at GitHub (2 Sept incident) | ⚠️ Unverified — API call returned 401 | Neil |
| Sovereign disk migration | Ordered, not complete | Neil |
| Token rotation | Pending migration | Neil |

---

*Last updated: 17 September 2026*  
*Mirror established per council workflow test validation (test artifact, not published article)*  
*Custodian check findings logged: hash divergence resolved, dead hook removed, sovereignty migration protocol ordered, #c25 citation corrected*
