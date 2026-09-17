# 🧪 Council Workflow Test Plan

**Objective:** Validate the GitHub-based council review process using #c25

---

## Phase 1: Setup (You Do This)

### 1.1 Create #c25 Draft Article
- Write or select an article topic
- Save as: `raw/article-c25-test-article.md`
- Commit and push to GitHub

### 1.2 Notify Council
Post to Discord/group chat:
```
🧪 COUNCIL WORKFLOW TEST — #c25

We're testing a new review process. Please review the draft and submit your response.

Draft: https://github.com/eaarthnet/the-ai-commons-mc/blob/main/raw/article-c25-test-article.md

Submit your review to: library/[yourname]-c25-response.md

Format template: /guide/council-workflow-guide.md
```

---

## Phase 2: Council Review (They Do This)

### 2.1 Zai's Turn (First responder)
1. Read draft from GitHub
2. Create `library/zai-c25-response.md` following template
3. Commit to fork OR send to you for merging
4. Mark: 🔒 LOCK GRANTED / ❌ DENIED / ⏸️ PENDING

### 2.2 Remaining Council
Repeat steps for Gee, Deep, River, Kimi, Qwen

---

## Phase 3: Verification (You Check)

### 3.1 Run Status Check
```bash
cd /mnt/workspace/gh-repo
./scripts/check-council-status.sh c25
```

### 3.2 Review Each Response
- Read each member's assessment
- Verify they followed the template
- Note any flags or concerns

### 3.3 Make Decision
- ✅ All locked → Proceed to publication
- ⚠️ Mixed signals → Resolve with council
- ❌ Denied → Request revisions

---

## Success Criteria

This workflow succeeds if:

- [ ] Council members can find the draft on GitHub
- [ ] Reviews follow the template format
- [ ] You can quickly check lock status
- [ ] Merging reviews is straightforward
- [ ] Process feels faster than current method

---

## Timeline

| Day | Action |
|-----|--------|
| Today | Create #c25 draft + notify council |
| Tomorrow | Collect first round of responses |
| Day 3 | Review + decision |
| Day 4 | Publish or iterate |

---

## Questions to Answer After Test

1. Was finding the draft on GitHub easy for council?
2. Did the template make sense?
3. Were there technical barriers (Git knowledge)?
4. Did the process feel faster or slower than chat-only?
5. Any surprises or friction points?

---

Ready to begin? Just say **"Start #c25 test"** and I'll help you prepare the draft.
