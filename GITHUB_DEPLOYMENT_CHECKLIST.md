# Quick GitHub + Cloudflare Deployment Checklist

## Prerequisites
- [ ] GitHub account
- [ ] Cloudflare account (free tier works)

## Get Cloudflare Credentials (5 minutes)

### Step 1: Get Account ID
- [ ] Go to https://dash.cloudflare.com
- [ ] Copy **Account ID** from right sidebar
- [ ] Save it somewhere safe

### Step 2: Create API Token
- [ ] Go to https://dash.cloudflare.com/profile/api-tokens
- [ ] Click "Create Token"
- [ ] Select "Edit Cloudflare Workers" template
- [ ] Click "Create Token"
- [ ] Copy the token immediately
- [ ] Save it somewhere safe

## Setup GitHub Repository (5 minutes)

### Step 1: Create Repository
- [ ] Go to https://github.com/new
- [ ] Name it: `data-app` (or preferred name)
- [ ] Click "Create repository"
- [ ] Don't initialize with README

### Step 2: Add GitHub Secrets
- [ ] Go to your repo → Settings → Secrets and variables → Actions
- [ ] Click "New repository secret"
- [ ] Add `CLOUDFLARE_API_TOKEN` with your API token value
- [ ] Add `CLOUDFLARE_ACCOUNT_ID` with your Account ID value

### Step 3: Push Your Code
```bash
cd "c:\Users\obaid\Pictures\Lab task"
git init
git add .
git commit -m "Initial commit: Data management app"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/data-app.git
git push -u origin main
```

## Watch Deployment (2 minutes)

- [ ] Go to your GitHub repo
- [ ] Click "Actions" tab
- [ ] Watch the workflow execute
- [ ] Wait for green checkmark ✅
- [ ] Your app is now live at: `https://data-app.workers.dev`

## Test Your Deployed App

- [ ] Visit `https://data-app.workers.dev`
- [ ] Test adding an entry
- [ ] Test viewing entries
- [ ] Test deleting an entry
- [ ] Refresh page to confirm persistence

## Future Updates (Automatic!)

Just push your changes to GitHub:
```bash
git add .
git commit -m "Your changes"
git push
```

Deployment happens automatically! ✨

---

## Troubleshooting Commands

```bash
# Check git status
git status

# View git log
git log --oneline

# Check remote
git remote -v

# Undo last commit (if needed)
git reset --soft HEAD~1

# Force push (use carefully!)
git push --force-with-lease
```

## Important: Environment Variables

Never commit secrets to Git! Use GitHub Secrets instead:
- API tokens → GitHub Secret
- Database credentials → GitHub Secret
- Private keys → GitHub Secret

---

**Questions?** Check [GITHUB_SETUP.md](GITHUB_SETUP.md) for detailed instructions.
