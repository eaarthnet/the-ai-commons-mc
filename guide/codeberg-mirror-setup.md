# 🌍 Codeberg Mirror — ACTIVE ✅

**Purpose:** Maintain a redundant copy of the EAARTHNET repository on Codeberg (Germany, non-profit) as a break from Microsoft enclosure.

---

## Status: ✅ LIVE & SYNCED

| Remote | URL | Status | Last Sync |
|--------|-----|--------|-----------|
| `origin` (GitHub) | `https://github.com/eaarthnet/the-ai-commons-mc.git` | Primary ✅ | c268b26 |
| `codeberg` | `https://codeberg.org/eaarthnet/the-ai-commons-mc.git` | Mirror ✅ | 871637b |

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

## Automating Future Syncs

### Git Hook (Recommended)

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

### Cron Job (Daily Check)

Add to crontab (`crontab -e`):
```bash
# Daily sync at 02:00 UTC
0 2 * * * cd /mnt/workspace/gh-repo && git pull origin main && git push codeberg main --force-with-lease
```

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

- **Tokens are stored locally only** — never committed to repo
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

# Compare commit hashes (should match)
git rev-parse origin/main
git rev-parse codeberg/main
```

---

## Maintenance Schedule

- **Weekly:** Verify both mirrors are in sync
- **Monthly:** Test pull from Codeberg
- **Quarterly:** Full audit of access credentials

---

*Last updated: 17 September 2026*  
*Mirror completed successfully — two soils now active*
