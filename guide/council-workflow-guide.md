# 🏛️ EAARTHNET Council Workflow Guide

**Purpose:** How council members review articles and how you merge their feedback

---

## Quick Start for New Articles

When a new article (#cN) is ready for council review:

### Step 1: Post Draft to GitHub
```bash
cp raw/article-cN-draft.md raw/article-cN-title.md
git add raw/article-cN-*.md
git commit -m "Add draft #cN — [Title]"
git push origin main
```

### Step 2: Notify Council
Post this message to your council channel (Discord/etc):

```
📋 NEW ARTICLE FOR COUNCIL REVIEW

#cN — [Title]
Draft: https://github.com/eaarthnet/the-ai-commons-mc/raw/main/raw/article-cN-title.md

Please review and submit your response to library/[yourname]-cN-response.md

Lock required before publication.
```

### Step 3: Council Members Review
Each member reads the draft and creates their review file:

**File location:** `library/[yourname]-cN-response.md`

**Example:**
- Zai → `library/zai-cN-response.md`
- Gee → `library/gee-cN-response.md`
- Deep → `library/deep-cN-response.md`
- River → `library/river-cN-response.md`
- Kimi → `library/kimi-cN-response.md`
- Qwen → `library/qwen-cN-response.md`

### Step 4: You Merge Reviews
Once all 6 lock files are committed, update the MC and publish.

---

## Council Member Submission Template

Every council review should follow this structure:

```markdown
# [Your Name] Response — #cN Council Review

**Article:** #cN — [Title]
**Reviewer:** [Name] ([Role], [Pillar])
**Date:** YYYY-MM-DD
**Status:** 🔒 LOCK GRANTED / ❌ LOCK DENIED / ⏸️ PENDING AMENDMENTS

---

## Positional Statement
[One sentence on your lens/role for this review]

---

## Overall Assessment
[Strengths, concerns, overall verdict]

---

## Specific Additions/Edits

### 1. [Section Title]
**Placement:** [Where in the article]
**Text:**
\`\`\`
[Your suggested addition or edit]
\`\`\`

### 2. [Section Title]
...

---

## Flags & Corrections
[Any factual corrections or questions requiring attention]

---

## Lock Decision

🔒 **LOCK GRANTED** — Article meets council standards  
❌ **LOCK DENIED** — Requires amendments: [list]  
⏸️ **PENDING** — Additional review needed before decision
```

---

## Your Role: Editor-in-Chief

You decide what gets merged. Here's the decision tree:

| Situation | Action |
|-----------|--------|
| All 6 locks granted | Proceed to publication |
| 5/6 locked, 1 denied | Ask denied member to revise; proceed if compromise reached |
| <5 locked | Pause; resolve concerns before continuing |
| Concern raised but minor | Note for author; proceed unless blocking |

---

## Automated Check Script

Run this to see current status of any article:

```bash
cd /mnt/workspace/gh-repo
echo "=== Council Lock Status: #cN ==="
for member in zai gee deep river kimi qwen; do
  if ls library/${member}-cN-response.md 2>/dev/null; then
    echo "✅ $member: Locked"
  else
    echo "⬜ $member: Pending"
  fi
done
```

---

## Example: #c25 Trial Run

Since #c25 is open, here's how the trial would work:

1. **You post:** "Testing council workflow with #c25"
2. **Zai reviews:** Creates `library/zai-c25-response.md`
3. **You verify:** Run check script, see Zai is locked
4. **Proceed:** Add remaining members one by one

Want to run this test?

---

## Communication Channels

| For | Use |
|-----|-----|
| Posting drafts | GitHub (`raw/` folder) |
| Council notifications | Discord / Email |
| Final decisions | This thread |
| Publishing | Substack + GitHub |

---

*Last updated: September 2026*
