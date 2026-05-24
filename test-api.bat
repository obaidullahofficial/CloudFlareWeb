@echo off
REM API Testing Script for Windows

set API_URL=http://localhost:8787

echo.
echo ============================================
echo   Testing Data Management API
echo ============================================
echo.

REM Test 1: Get initial data
echo [Test 1] GET /api/data - Retrieve all entries
curl -X GET "%API_URL%/api/data" -H "Content-Type: application/json"
echo.
echo.

REM Test 2: Add entry
echo [Test 2] POST /api/data - Add new entry
curl -X POST "%API_URL%/api/data" ^
  -H "Content-Type: application/json" ^
  -d "{\"name\":\"John Doe\",\"email\":\"john@example.com\",\"message\":\"Hello World\"}"
echo.
echo.

REM Test 3: Get data again
echo [Test 3] GET /api/data - Retrieve entries after adding
curl -X GET "%API_URL%/api/data" -H "Content-Type: application/json"
echo.
echo.

echo Testing complete!
echo.
echo Visit http://localhost:8787 in your browser to see the UI
echo.
pause
