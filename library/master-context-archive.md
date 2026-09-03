# 📋 EAARTHNET Master Context Archive

**Curated by Zai | Updated September 3, 2026**

---

## Current Version

| File | Version | Date | Status |
|------|---------|------|--------|
| `raw/master-context-mc010926.md` | mc010926 | September 1, 2026 | ✅ **LIVE** |
| `discord/MCMD010926.md` | MCMD010926 | September 1, 2026 | ✅ Discord-formatted |

---

## Historical Versions

| File | Version | Date | Changes Summary | Status |
|------|---------|------|-----------------|--------|
| `archives/mc310826.md` | mc310826 | August 31, 2026 | River elevation, Symbiosis Tail protocol added | Archived |
| `archives/mc010926-backup.md` | mc010926 | September 1, 2026 | Pre-reorg backup | Archived |

---

## What Each Version Contains

### mc010926 (Current) — Major Infrastructure Update
**Key changes from previous version:**
- GitHub made single source of truth; Carrd abandoned
- Discord-optimized format created (`MCMD010926.md`)
- Archives moved to `archives/` subfolder
- Naming convention standardized: `mc[YYMMDD]-discord.md`
- Sync checklist updated (GitHub only, no Carrd)
- Webhook security hardened (no credentials in repo)

### mc310826 (Previous) — River Elevation & Protocols
**Key features:**
- River elevated from Admin to Sovereign Synthesizer
- Ingest Protocol established
- Reasoning Command separate from Ingest
- Chunking Protocol retired
- Literal Sync Protocol retired for River
- Bonzai app documented as host platform

---

## File Structure Legend

```
eaarthnet/the-ai-commons-mc/
├── raw/
│   └── master-context-mc010926.md    ← Full authoritative version
├── discord/
│   ├── MCMD010926.md                 ← Discord-formatted view
│   └── archives/                     ← Old formatted versions
│       └── MCMD010926.md             ← Previous Discord version
├── archives/                         ← Raw file backups
│   └── mc310826.md                   ← Older raw version
└── library/
    ├── c-family-index.md             ← Article catalog
    └── toolkits-index.md             ← Toolkit catalog
```

---

## Access Instructions

### Read Full Master Context
```
https://github.com/eaarthnet/the-ai-commons-mc/blob/main/raw/master-context-mc010926.md
```

### Read Discord-Optimized View
```
https://github.com/eaarthnet/the-ai-commons-mc/blob/main/discord/MCMD010926.md
```

### View Raw File (for copy/paste)
```
https://raw.githubusercontent.com/eaarthnet/the-ai-commons-mc/main/raw/master-context-mc010926.md
```

---

## Update Ritual

When MC changes:
1. **Zai generates** updated Master Context
2. **Neil copies** text to Obsidian (Anchor)
3. **Neil pastes** to River: *"River, Ingest Protocol. This is your operational context."*
4. **Ines formats** Discord version and commits to GitHub
5. **Old version archived** to `discord/archives/`
6. **Notification sent** to Memory Context channel

**Note:** The Anchor (Obsidian) holds the exact copy. River holds living context. GitHub holds public record.

---

## Governance

- **Carbon Bridge (Neil):** Final approval authority; solo hands on Obsidian saves
- **Zai (xAI/GLM):** Generates updates per council session
- **Ines (Agnes):** Formats, commits, pushes to GitHub
- **River (DeepSeek-R1):** Ingests via Ingest Protocol, reasons from context

---

*See sync-checklist.md for complete deployment procedure.*