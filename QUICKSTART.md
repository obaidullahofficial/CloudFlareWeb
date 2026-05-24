# Quick Start Guide

## Installation & Setup

### Step 1: Install Dependencies
```bash
npm install
```

### Step 2: Install Wrangler CLI (if not already installed)
```bash
npm install -g @cloudflare/wrangler
```

### Step 3: Login to Cloudflare
```bash
wrangler login
```
Follow the browser prompt to authenticate with your Cloudflare account.

---

## Development & Testing

### Run Development Server
```bash
npm run dev
```

This will start a local server at `http://localhost:8787`

### Features to Test:

1. **Add Entry**
   - Fill in Name, Email, and Message
   - Click "Submit Entry"
   - Verify success message appears

2. **View Data**
   - Check that entries appear in the right panel
   - Verify timestamp is displayed
   - Click "Refresh Data" to reload entries

3. **Delete Entry**
   - Click the "Delete" button on any entry
   - Confirm the deletion dialog
   - Verify entry is removed

4. **Persistence**
   - Add an entry
   - Refresh the browser page
   - Verify the entry still exists

---

## API Testing

### Using curl (Windows Command Prompt or PowerShell)

**Get all data:**
```bash
curl http://localhost:8787/api/data
```

**Add an entry:**
```bash
curl -X POST http://localhost:8787/api/data -H "Content-Type: application/json" -d "{\"name\":\"Test User\",\"email\":\"test@example.com\",\"message\":\"Test message\"}"
```

**Or run the test script:**
```bash
test-api.bat
```

---

## Deployment to Production

### Deploy to Cloudflare Workers:
```bash
npm run deploy
```

Your application will be available at:
- `https://data-app.workers.dev` (default)
- Or your configured custom domain

---

## Database (KV Storage)

The application uses **Cloudflare KV** for persistent storage:

- **Storage Key**: `entries`
- **Storage Format**: JSON array
- **Free Tier**: 100,000 read operations / month

Data is automatically persisted in KV and survives:
- Browser refreshes
- Server restarts
- Deployments

---

## Troubleshooting

### Issue: "Cannot find module 'wrangler'"
**Solution:**
```bash
npm install -g @cloudflare/wrangler
```

### Issue: "Not authenticated"
**Solution:**
```bash
wrangler login
```

### Issue: Data not persisting
**Solution:**
1. Ensure KV namespace exists in `wrangler.toml`
2. Restart the development server: `npm run dev`
3. Check browser console for errors (F12)

### Issue: CORS errors
- CORS is enabled in the worker.js
- Clear browser cache (Ctrl+Shift+Delete)
- Try in an incognito/private window

### Issue: Port 8787 already in use
**Solution:**
```bash
wrangler dev --port 8788
```

---

## File Structure

```
├── wrangler.toml        ← Cloudflare configuration
├── worker.js            ← Backend API (handles all routes)
├── index.html           ← Frontend UI (served by worker.js)
├── package.json         ← Node dependencies
├── README.md            ← Full documentation
├── QUICKSTART.md        ← This file
├── test-api.bat         ← API test script (Windows)
└── test-api.sh          ← API test script (Linux/Mac)
```

---

## Next Steps

1. ✅ Run `npm install`
2. ✅ Run `wrangler login`
3. ✅ Run `npm run dev`
4. ✅ Open http://localhost:8787
5. ✅ Test adding/viewing/deleting entries
6. ✅ Run `npm run deploy` to go live

Enjoy your data management app! 🚀
