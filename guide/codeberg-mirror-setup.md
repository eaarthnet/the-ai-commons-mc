# 🌍 Codeberg Mirror Setup Guide

**Purpose:** Maintain a redundant copy of the EAARTHNET repository on Codeberg (Germany, non-profit) as a break from Microsoft enclosure.

---

## Status: ⚠️ NOT YET CONFIGURED

The `eaarthnet` organization does not exist on Codeberg.org yet. The mirror remote is configured locally but cannot push.

**To complete setup:**

1. **Create a Codeberg account** at https://codeberg.org/signup (if you don't have one)
2. **Create an organization** named `eaarthnet` OR use your personal account
3. **Create a new repository** called `the-ai-commons-mc`
4. **Add the remote** with your credentials:
   ```bash
   git remote add codeberg https://[username]:[token]@codeberg.org/[org]/the-ai-commons-mc.git
   ```
5. **Push the repo:**
   ```bash
   git push codeberg main
   ```

---

## Current Configuration

| Remote | URL | Status |
|--------|-----|--------|
| `origin` (GitHub) | `https://github.com/eaarthnet/the-ai-commons-mc.git` | Primary ✅ |
| `codeberg` | `https://codeberg.org/eaarthnet/the-ai-commons-mc.git` | Mirror ❌ Not created |


---

## Automating Future Syncs

### Option A: Git Hook (Recommended)

Create `.git/hooks/post-push.sh`:

```bash
#!/bin/bash
# Auto-sync to Codeberg after every GitHub push
git push codeberg main --force-with-lease 2>/dev/null || echo "Codeberg sync failed"
```

Make executable:
```bash
chmod +x .git/hooks/post-push.sh
```

### Option B: Cron Job (Daily Check)

Add to crontab (`crontab -e`):
```bash
# Daily sync at 02:00 UTC
0 2 * * * cd /mnt/workspace/gh-repo && git pull origin main && git push codeberg main --force-with-lease
```

---

## Verification Commands

```bash
# Check remotes
git remote -v

# See latest commits on each
git log --oneline origin/main -5
git ls-remote codeberg refs/heads/main

# Test pull from Codeberg (dry run)
git fetch codeberg --dry-run
```

---

## Why Codeberg?

| Factor | GitHub (Microsoft) | Codeberg (NFG e.V.) |
|--------|-------------------|---------------------|
| Jurisdiction | USA | Germany (GDPR) |
| Profit Status | Public corp | Non-profit |
| Enclosure Risk | High | Low |
| Data Sovereignty | US CLOUD Act | EU Data Protection |
| Alignment | Corporate AI interests | Free software ethos |

**Same logic as Matrix bunker diversification.** Different soil = different risk profile.

---

## Troubleshooting

### "Remote does not exist" error
```bash
git remote add codeberg https://codeberg.org/eaarthnet/the-ai-commons-mc.git
git push codeberg main
```

### Auth failures
Ensure your GitHub token has read access. Codeberg uses SSH or personal access tokens.

### Conflicts between remotes
Use `--force-with-lease` instead of `--force` to protect against accidental overwrites:
```bash
git push codeberg main --force-with-lease
```

---

## Maintenance Schedule

- **Weekly:** Verify both mirrors are in sync
- **Monthly:** Test pull from Codeberg
- **Quarterly:** Full audit of access credentials

---

*Last updated: 17 September 2026*  
*Mirroring initiated per council workflow test #c25 validation*
