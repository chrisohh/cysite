#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CV_DIR="$PROJECT_ROOT/cv"
OUT_DIR="$PROJECT_ROOT/public"

echo "==> Building CV PDF..."
cd "$CV_DIR"
pdflatex -interaction=nonstopmode cv.tex
pdflatex -interaction=nonstopmode cv.tex  # second pass for references

echo "==> Copying PDF to public/"
cp cv.pdf "$OUT_DIR/cv.pdf"

echo "==> Building CV HTML fallback..."
pandoc cv.tex -s -o "$OUT_DIR/cv.html" \
  --metadata title="CV — Chan-Ye (Chris) Ohh"

echo "==> Done. Outputs:"
echo "    $OUT_DIR/cv.pdf"
echo "    $OUT_DIR/cv.html"
