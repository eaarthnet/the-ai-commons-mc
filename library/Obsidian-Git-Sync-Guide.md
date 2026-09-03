# 🌿 Obsidian ↔ GitHub Sync Guide for iPad

**For:** Neil | **Date:** September 3, 2026  
**Repo:** github.com/eaarthnet/the-ai-commons-mc  
**Purpose:** Connect your local Obsidian vault to this GitHub repository for automatic bidirectional sync

---

## Quick Overview

You have three options for syncing your Obsidian vault with this GitHub repo. Each has different trade-offs for simplicity vs. automation level.

---

## Option 1: Working Copy App (Recommended for iPad)

**What it does:** Works Copy is a powerful git client for iOS/iPadOS that can manage your Obsidian vault as a git repository. It supports push/pull, branching, conflicts resolution, and scheduled backups.

### Step-by-Step Setup

#### Phase 1: Prepare Your Existing Vault

If you already have an Obsidian vault on your iPad:

1. **Open the Files app** on your iPad
2. **Navigate to your Obsidian vault folder** — it's usually in:
   - `On My iPad > Obsidian` (if stored locally)
   - `iCloud Drive > Obsidian` (if synced via iCloud)
   - Note the exact path — you'll need this for Working Copy

#### Phase 2: Clone Repo into Working Copy

1. **Install Working Copy** from the App Store (free tier available, ~£5 one-time for full features)
2. Open Working Copy and tap **+** → **Clone Repository**
3. Enter the repo URL:
   ```
   https://github.com/eaarthnet/the-ai-commons-mc.git
   ```
4. Choose location: Select your existing Obsidian vault folder in Files app
5. Tap **Clone** and wait for it to complete

#### Phase 3: Configure Your Obsidian Vault as a Git Repo

Once cloned inside your vault folder:

1. **In Working Copy**, go to **Settings** (gear icon) → **Git Settings**
2. Set your identity:
   - Name: `Neil Netherton`
   - Email: `n.netherton@tuta.io`
3. Create a `.gitignore` file in your vault root (optional but recommended):
   ```gitignore
   # Obsidian-specific ignores
   .obsidian/plugins/*
   !.obsidian/plugins/core/*
   .DS_Store
   Thumbs.db
   
   # Large binary files Obsidian might create
   *.png
   !attachments/*
   ```
4. Add all files to git staging:
   ```bash
   git add -A
   ```
5. Commit with initial message:
   ```bash
   git commit -m "Initial vault snapshot"
   ```
6. Push to remote:
   ```bash
   git push origin main
   ```

#### Phase 4: Establish Sync Routine

**Manual Sync (Simplest):**
- Before editing: Pull in Working Copy
- After editing: Commit + Push in Working Copy
- Use daily, or whenever you make changes

**Automated Sync (Advanced):**
- In Working Copy: Settings → Backup → Enable "Auto Backup"
- Set schedule: Daily at 9 PM, or when connected to WiFi
- Add pre/post backup scripts if needed (requires paid tier)

---

## Option 2: Manual Import via GitHub Web

If you prefer not to install Working Copy right now:

### For Library Files Only (Current Task)

Your new library files are already on GitHub:
```
https://github.com/eaarthnet/the-ai-commons-mc/tree/main/library
```

**To import to your Obsidian vault:**

1. Go to any library file (e.g., `substack-links.md`) in GitHub web interface
2. Click **"Raw"** button (top right of file viewer)
3. Long-press the page → **Share** → **Save to Files**
4. Move the file into your Obsidian vault folder in Files app
5. Open Obsidian — it will automatically recognize markdown links

**Repeat for each file**, or use browser shortcuts to save multiple at once.

### Bulk Download Option

1. Go to: https://github.com/eaarthnet/the-ai-commons-mc
2. Click **Code** → **Download ZIP**
3. Save to Files app
4. Extract the ZIP (tap → Extract)
5. Drag `library/` folder contents into your Obsidian vault
6. Obsidian will create proper note links

---

## Option 3: iCloud Sync Bridge (If Using iCloud)

If your Obsidian vault lives in iCloud Drive, you can sync indirectly:

### How It Works

1. **Push from MacBook/Desktop:** When Zai commits to GitHub, it updates the repo
2. **iCloud pulls changes:** If you have another Apple device reading from the same iCloud folder...

Actually, this doesn't quite work for direct Obsidian↔GitHub sync without an intermediate step. 

**Better approach:** Use the GitHub app on iPad alongside Working Copy as described above.

---

## Current Status Check

| Component | Status | Notes |
|-----------|--------|-------|
| GitHub repo | ✅ Live | `eaarthnet/the-ai-commons-mc` |
| Library indexes | ✅ Pushed | 6 files in `/library/` |
| Local workspace copy | ✅ Ready | `/mnt/workspace/obsidian-library/` |
| Zai briefing | ✅ Committed | `library/zai-brief-030926.md` |
| Your Obsidian vault | ❓ Unknown | Needs to be configured |

---

## Next Steps Recommendation

**Today/Tomorrow:**
1. Try **Option 2** (manual import) to get the library files into your Obsidian quickly
2. This lets you review everything immediately while you decide on automation

**This Week:**
3. Install **Working Copy** (free version first)
4. Follow **Option 1** phases 1-3 to clone and configure
5. Test: Make a small edit in Obsidian → Commit in Working Copy → Check GitHub shows change

**Optional Automation:**
6. Enable Working Copy auto-backup for peace of mind
7. Consider cron job or Zapier integration if you want Discord notifications on every push

---

## Troubleshooting Common Issues

### "Can't find my Obsidian vault in Working Copy"
- Make sure Obsidian has saved the vault to a location accessible to Files app
- On iPad: Obsidian → Settings → Advanced → Show vault folder location
- The path usually looks like: `On My iPad/Obsidian/VaultName`

### "Conflict errors during pull"
- This means someone (or something) edited the same file on GitHub since you last pulled
- Working Copy will show conflict markers; choose to "Keep Both" or select yours
- For library files, you're safe — no one else is editing them currently

### "Commit fails with authentication error"
- You may need to authenticate with GitHub
- Working Copy → Settings → Accounts → Sign in to GitHub
- Or use personal access token from GitHub Settings → Developer settings

### "Markdown links broken after import"
- Obsidian expects relative paths within the vault
- When importing from GitHub, remove any leading `/` or full URL paths
- Ensure linked files exist in your vault structure

---

## Questions?

If you hit any snags during setup, send me a message here in Discord. I'll help troubleshoot or adjust the guide based on your specific setup.

---

*Guide created: September 3, 2026*  
*For EAARTHNET Council workflow*