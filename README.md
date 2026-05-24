# Data Management System

A full-stack web application built with Cloudflare Workers for managing data entries with a beautiful web interface.

## Features

✅ **Frontend**
- Responsive, modern UI with gradient design
- Form for inputting data (Name, Email, Message)
- Real-time data display with entries listed as cards
- Edit and Delete buttons for each entry
- Success/error message notifications

✅ **Backend**
- REST API with CORS enabled
- GET /api/data - Retrieve all entries
- POST /api/data - Add new entry
- PUT /api/data/{id} - Update entry
- DELETE /api/data/{id} - Delete entry

✅ **Database**
- Uses Cloudflare KV for persistent storage
- Stores entries with timestamps
- Automatic ID generation using timestamps

## Project Structure

```
├── wrangler.toml       # Cloudflare Workers configuration
├── worker.js           # Backend API and server
├── index.html          # Frontend web interface
├── package.json        # Dependencies
└── README.md           # This file
```

## Setup Instructions

### Prerequisites
- Node.js 16+
- Cloudflare account (free tier works)
- Wrangler CLI

### Installation

1. **Install Wrangler globally:**
   ```bash
   npm install -g @cloudflare/wrangler
   ```

2. **Navigate to project directory:**
   ```bash
   cd "c:\Users\obaid\Pictures\Lab task"
   ```

3. **Install dependencies:**
   ```bash
   npm install
   ```

4. **Login to Cloudflare:**
   ```bash
   wrangler login
   ```

### Development

Run the development server:
```bash
npm run dev
```

The app will be available at `http://localhost:8787`

### Deployment

Deploy to Cloudflare Workers:
```bash
npm run deploy
```

Your app will be live at `https://data-app.workers.dev` (or your configured subdomain)

## API Endpoints

### GET /api/data
Retrieve all stored entries

**Response:**
```json
[
  {
    "id": "1234567890",
    "name": "John Doe",
    "email": "john@example.com",
    "message": "Hello world",
    "timestamp": "2026-05-22T10:30:00.000Z"
  }
]
```

### POST /api/data
Create a new entry

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "message": "Hello world"
}
```

**Response:**
```json
{
  "success": true,
  "entry": { ... }
}
```

### PUT /api/data/{id}
Update an existing entry

**Request Body:**
```json
{
  "name": "Jane Doe",
  "email": "jane@example.com",
  "message": "Updated message"
}
```

### DELETE /api/data/{id}
Delete an entry

**Response:**
```json
{
  "success": true,
  "message": "Entry deleted"
}
```

## Testing

### Manual Testing

1. Open the application in your browser
2. Fill in the form with Name, Email, and Message
3. Click "Submit Entry"
4. Verify the entry appears in the "Stored Data" section
5. Test Edit and Delete buttons
6. Refresh the page to confirm data persists

### API Testing with curl

**Get all data:**
```bash
curl http://localhost:8787/api/data
```

**Add entry:**
```bash
curl -X POST http://localhost:8787/api/data \
  -H "Content-Type: application/json" \
  -d '{"name":"John","email":"john@example.com","message":"Test"}'
```

**Delete entry:**
```bash
curl -X DELETE http://localhost:8787/api/data/{id}
```

## Database Persistence

Data is stored in Cloudflare KV storage under the key `entries`. Each entry includes:
- **id**: Unique identifier (timestamp-based)
- **name**: Entry name
- **email**: Entry email
- **message**: Entry content
- **timestamp**: ISO format creation date

## Browser Compatibility

- Chrome/Edge 88+
- Firefox 85+
- Safari 14+
- Mobile browsers supported with responsive design

## Features in Development

- 🔄 Full edit functionality with modal
- 🔐 User authentication
- 📊 Data analytics dashboard
- 🔍 Search and filter functionality
- 📥 Export to CSV
- 📄 Pagination

## Troubleshooting

**Issue: "Not authenticated"**
- Run `wrangler login` and follow the prompts

**Issue: Data not persisting**
- Ensure KV namespace is properly configured in `wrangler.toml`
- Check that you're logged into the correct Cloudflare account

**Issue: CORS errors**
- CORS is enabled for all origins in the worker.js
- If issues persist, check browser console for specific errors

## License

MIT - Feel free to use this project for any purpose

## Support

For issues or questions, check the Cloudflare Workers documentation:
https://developers.cloudflare.com/workers/
