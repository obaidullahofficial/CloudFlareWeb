#!/bin/bash
# API Testing Script

API_URL="http://localhost:8787"

echo "🧪 Testing Data Management API"
echo "================================"
echo ""

# Test 1: Get initial data
echo "📋 Test 1: GET /api/data"
curl -X GET "$API_URL/api/data" -H "Content-Type: application/json"
echo ""
echo ""

# Test 2: Add entry
echo "📝 Test 2: POST /api/data (Add Entry)"
curl -X POST "$API_URL/api/data" \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com","message":"Hello World"}'
echo ""
echo ""

# Test 3: Get data again
echo "📋 Test 3: GET /api/data (After adding)"
curl -X GET "$API_URL/api/data" -H "Content-Type: application/json"
echo ""
echo ""

echo "✅ Testing complete!"
echo ""
echo "🔗 Visit http://localhost:8787 in your browser to see the UI"
