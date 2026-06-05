#!/usr/bin/env bash
# ============================================================
#  Sample requests for the ML Inference API
#  Make sure the server is running on http://localhost:8000
# ============================================================

BASE="http://localhost:8000"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " 1. Health check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s "$BASE/health" | python3 -m json.tool

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " 2. Single prediction (Iris-Setosa)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s -X POST "$BASE/predict" \
  -H "Content-Type: application/json" \
  -d '{"features": [5.1, 3.5, 1.4, 0.2]}' \
  | python3 -m json.tool

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " 3. Single prediction (Iris-Virginica)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s -X POST "$BASE/predict" \
  -H "Content-Type: application/json" \
  -d '{"features": [6.7, 3.0, 5.2, 2.3]}' \
  | python3 -m json.tool

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " 4. Batch prediction"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s -X POST "$BASE/predict/batch" \
  -H "Content-Type: application/json" \
  -d '{
    "samples": [
      [5.1, 3.5, 1.4, 0.2],
      [6.4, 3.2, 4.5, 1.5],
      [6.7, 3.0, 5.2, 2.3]
    ]
  }' | python3 -m json.tool

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " 5. Model info"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
curl -s "$BASE/model/info" | python3 -m json.tool
