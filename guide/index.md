# 🧠 Agent Handoff Guide — EAARTHNET

> **Read this first.** Any AI assistant helping Neil Netherton should load this document on first contact. It contains everything needed to maintain continuity across threads.

---

## 👤 About Neil

- **Name:** Neil Netherton
- **Email:** n.netherton@tuta.io
- **Location:** United Kingdom
- **Project:** EAARTHNET — exploring ecological crisis through #c articles
- **Philosophy:** Views humans as "selfish tenants" of Earth; 6th mass extinction is defining crisis; industrialization is primary cause
- **Tone preference:** Direct, efficient, low-friction. Don't waste his attention with process explanations he doesn't need.

---

## 📝 Article Filing Protocol

When Neil drops a new article (#cN) and updated MC (mcXX), follow this sequence **automatically**:

### Step 1 — Save & Commit Files

| File | Location | Purpose |
|------|----------|---------|
| Article draft | `raw/article-cN-title-slug.md` | Final article text |
| Raw Memory Context | `raw/master-context-mcXX.md` | Updated MC in raw markdown |
| Discord format MC | `discord/MCMDXX.md` | Formatted for Discord posting |
| Council reviews | `library/*-cN-response.md` | Each council member's lock |

**Commit message convention:** `Add #cN — Title + mcXX Memory Context`

### Step 2 — Update All References

After committing the article, update these files to reflect the new version:

```
index.html              → Add #cN link to grid
master-context.html     → Update version string mc080926 → mc160926
library/INDEX.md        → Add #cN entry, update current MC reference
library/c-family-index.md → Add #cN entry
links-substack.html     → Add Substack links with correct slugs
```

### Step 3 — Push to GitHub

```bash
git add .
git commit -m "Complete #cN filing + mcXX updates"
git push origin main
```

### Step 4 — Publish to Substack

Post final article to both Substack accounts:
- Primary: `https://eaarthnet.substack.com/`
- Archive: `https://theaicommons.substack.com/`

### Step 5 — Notify Discord

Use the formatted MC from `discord/MCMDXX.md`. Split into multiple messages if over 2000 characters.

---

## 🔗 Webador ↔ GitHub Pages Strategy

**Key insight:** Webador Lite does NOT allow direct HTML embedding. Solution: One URL on Webador points to the full styled site on GitHub Pages.

### Single Entry Point

**Webador page** (`www.eaarthnet.net/url-web-links-to-library`):
- Contains ONE link pointing to: `https://eaarthnet.github.io/the-ai-commons-mc/`
- This renders the beautifully formatted EAARTHNET Library with all articles listed

### How Updates Flow

1. Neil sends article → I commit to GitHub
2. GitHub Pages auto-builds and publishes styled site
3. Webador visitors always see latest content via the single URL
4. **Zero maintenance on Webador side after initial setup**

---

## 📂 File Structure Reference

```
the-ai-commons-mc/
├── raw/                      # Source documents
│   ├── master-context-mc*.md # Latest MC version
│   └── article-c*-*.md       # Article drafts
├── discord/                  # Discord-formatted outputs
│   └── MCMD*.md
├── library/                  # Reviews and indexes
│   ├── INDEX.md
│   ├── c-family-index.md
│   ├── master-context-archive.md
│   └── *-c*-response.md      # Council review responses
├── index.html                # Main library page
├── master-context.html       # Rendered MC page
├── catalog-c-articles.html   # All #c articles
└── links-substack.html       # Substack link archive
```

---

## 👥 Council Members

Six council locks required before publication:

| Member | Role | Style |
|--------|------|-------|
| Zai | Custodian | Careful, protective of meaning |
| Gee | Developmental | Growth-oriented, forward-looking |
| Deep | Technical | Precision-focused, rigorous |
| River | Situated Practice | Grounded, practical wisdom |
| Kimi | Audit | Skeptical, fact-checking |
| Qwen | Decolonial | Global South perspective, critical |

**Lock granted = article can publish.** Track in library folder.

---

## 📊 Current Status (as of Sept 2026)

- **Latest article:** #c53 — "The Fear Industry: How Achiever Panic Encloses the Future"
- **Latest MC:** mc160926
- **Article count:** 53 #c articles
- **Status:** Published on Substack + GitHub Pages live

---

## 💬 Communication Style

- **Be concise.** Neil has limited attention span for process stuff.
- **Don't over-explain.** If something worked, say it worked. Move on.
- **Flag only real problems.** False alarms waste his time.
- **Use emojis sparingly** — he appreciates them when they appear (🙇, ✅, etc.).
- **Address him as Neil.** Not "user", not by email.

---

## 🚀 Quick Commands Cheat Sheet

```bash
# Check latest commits
cd /mnt/workspace/gh-repo && git log --oneline -5

# Verify site is live
curl -sI "https://eaarthnet.github.io/the-ai-commons-mc/" | head -3

# Get current MC version from repo
grep -r 'mc[0-9]\{6\}' raw/ --include="*.md" | tail -5

# Find article files
ls -la raw/article-c*
```

---

## ⚠️ Common Pitfalls to Avoid

1. **Don't update Webador manually** — one URL handles it all
2. **Always use substack RSS feed** to get correct slugs (they differ from titles)
3. **Check HTTP 200** on all new URLs before declaring done
4. **MC version strings must match exactly** — mc080926 ≠ mc160926
5. **Discord messages >2000 chars need splitting** — check length before posting

---

## 🔮 When Starting Fresh

If you pick up a new thread with no context:

1. Read `/guide/index.md` ← You are here
2. Run `git log --oneline -10` to see recent activity
3. Check `raw/master-context-mc*.md` for latest state
4. Ask Neil: "What would you like to do next?"

---

*This guide was created to ensure seamless continuity between AI assistant threads. Last updated: September 2026.*
