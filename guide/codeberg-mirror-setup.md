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

Create `scripts/push-all.sh`:

```bash
#!/bin/bash
# Push to both GitHub and Codeberg simultaneously
echo "Pushing to origin (GitHub)..."
git push origin main || { echo "GitHub push failed"; exit 1; }

echo "Pushing to codeberg..."
git push codeberg main --force-with-lease || { echo "Codeberg push failed"; exit 1; }

echo "✅ Both mirrors synced"
```

Make executable:
```bash
chmod +x scripts/push-all.sh
```

**Habit-based automation:** Use `./scripts/push-all.sh` instead of plain `git push`.

### Cron Job (Daily Backstop)

Add to crontab (`crontab -e`):
```bash
# Daily sync check at 02:00 UTC
0 2 * * * cd /mnt/workspace/gh-repo && git pull origin main && ./scripts/push-all.sh
```

**Note:** Cron is a backstop, not primary. It limits drift to 24 hours but doesn't eliminate it between pushes.

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

- **Tokens should be stored outside the sandbox** — see Sovereign Disk section below
- Use `--force-with-lease` instead of `--force` to protect against accidental overwrites
- Rotate tokens periodically via Settings → Applications
- Delete tokens when no longer needed

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

## Sovereign Disk Migration (URGENT)

⚠️ **Current state:** The working repo, embedded tokens, and automation live in the Agnes AI sandbox (/mnt/workspace/gh-repo/). This is cloud platform territory — mortal infrastructure.

**Required actions:**

1. **Clone the repo to sovereign disk:**
   ```bash
   cp -r /mnt/workspace/gh-repo ~/eaarthnet-mc
   cd ~/eaarthnet-mc
   ```

2. **Reissue tokens** (more secure than reusing sandbox tokens):
   - GitHub: Settings → Developer settings → Personal access tokens → Generate new token
   - Codeberg: Settings → Applications → Generate New Token
   - Enter at prompt-time or configure credential helper:
     ```bash
     git config --global credential.helper store  # or use pass/gpg-agent
     ```

3. **Update remote URLs** with new tokens if rotated:
   ```bash
   git remote set-url origin https://eaarthnet:[NEW_GITHUB_TOKEN]@github.com/eaarthnet/the-ai-commons-mc.git
   git remote set-url codeberg https://eaarthnet:[NEW_CODEBERG_TOKEN]@codeberg.org/eaarthnet/the-ai-commons-mc.git
   ```

4. **Delete automation scripts from sandbox:**
   ```bash
   rm .git/hooks/post-push.sh 2>/dev/null  # Remove any dead hooks
   ```

**Timeline:** Before next major release or within 7 days.

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

*Last updated: 17 September 2026*  
*Mirror established per council workflow test #c25 validation*  
*Custodian check findings logged: stale hash table corrected, dead hook removed, sovereignty migration ordered*
