# GitHub + Cloudflare Workers Setup Guide

This guide explains how to set up automatic deployment from GitHub to Cloudflare Workers.

## Step 1: Create a GitHub Repository

### Option A: Create New Repository
1. Go to [github.com/new](https://github.com/new)
2. Create a new repository named `data-app` (or your preferred name)
3. Choose public or private
4. **Do NOT** initialize with README (you already have one)

### Option B: Push Existing Project
If you already have a GitHub repo:
1. Navigate to your repository settings
2. Copy your repository URL

---

## Step 2: Get Cloudflare API Credentials

You need two things from Cloudflare:

### Get Your Account ID:
1. Log in to [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Go to any domain or the root account page
3. In the right sidebar, find **Account ID** under **API**
4. Copy it (looks like: `a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6`)

### Generate API Token:
1. Go to [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens)
2. Click **Create Token**
3. Use template: **Edit Cloudflare Workers**
4. Configure permissions:
   - **Account resources**: All accounts
   - **Zone resources**: All zones
   - **Permissions**: 
     - Account > Cloudflare Workers > Edit
     - Account > Cloudflare Workers KV > Edit
5. Click **Continue to summary** → **Create Token**
6. **Copy the token immediately** (you won't see it again)

---

## Step 3: Add GitHub Secrets

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**

### Add Secret 1: CLOUDFLARE_API_TOKEN
- **Name:** `CLOUDFLARE_API_TOKEN`
- **Value:** Paste your Cloudflare API token
- Click **Add secret**

### Add Secret 2: CLOUDFLARE_ACCOUNT_ID
- **Name:** `CLOUDFLARE_ACCOUNT_ID`
- **Value:** Paste your Cloudflare Account ID
- Click **Add secret**

✅ **Secrets are now configured!**

---

## Step 4: Push Code to GitHub

### First Time Setup:

```bash
# Navigate to your project
cd "c:\Users\obaid\Pictures\Lab task"

# Initialize Git repository
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: Data management app with Cloudflare Workers"

# Add GitHub as remote (replace USERNAME/REPO)
git remote add origin https://github.com/USERNAME/data-app.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Future Updates:

```bash
git add .
git commit -m "Your message here"
git push
```

---

## Step 5: Monitor Deployments

1. Go to your GitHub repository
2. Click the **Actions** tab
3. You'll see your workflow running
4. Wait for it to complete (usually 2-3 minutes)
5. ✅ Green checkmark = Successfully deployed!

---

## What Happens on Every Push:

1. ✅ GitHub detects code push to `main` branch
2. ✅ GitHub Actions workflow starts automatically
3. ✅ Installs Node dependencies
4. ✅ Runs `npm run deploy`
5. ✅ Deploys to Cloudflare Workers
6. ✅ Your app is live!

---

## Your Application URL

After first deployment, your app will be live at:
```
https://data-app.workers.dev
```

(Or your configured custom domain/subdomain)

---

## Troubleshooting

### Issue: Deployment fails with auth error
**Solution:** Double-check your API token and Account ID in GitHub Secrets

### Issue: Workflow doesn't trigger
**Solution:** Make sure you pushed to the `main` or `master` branch

### Issue: Want to deploy from a different branch
**Edit:** `.github/workflows/deploy.yml` line 6-8 to add your branch name

### Issue: Want to deploy manually
1. Go to **Actions** tab
2. Select the workflow
3. Click **Run workflow**
4. Select your branch
5. Click **Run workflow**

---

## Security Best Practices

✅ **Never commit secrets** to Git (GitHub Secrets handle this)  
✅ **Rotate API tokens** periodically in Cloudflare dashboard  
✅ **Use branch protection** on `main` branch  
✅ **Review deployments** before pushing sensitive changes  

---

## Environment Variables

If you need to add environment variables (API keys, database URLs, etc.):

1. Add them to `wrangler.toml`:
```toml
[env.production]
vars = { MY_VAR = "value" }
```

2. Add GitHub Secrets for sensitive values

3. Update workflow if needed to pass secrets

---

## Next Steps

1. ✅ Get Cloudflare API credentials
2. ✅ Add GitHub Secrets
3. ✅ Push code to GitHub
4. ✅ Watch the deployment in Actions tab
5. ✅ Visit your deployed URL
6. ✅ Test the application

Your app is now automatically deployed! 🚀

---

## Useful Links

- [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens)
- [GitHub Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- [Wrangler Documentation](https://developers.cloudflare.com/workers/wrangler/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
