#!/bin/bash
# Auto-recompile main.pdf whenever any .tex file is saved
cd "$(dirname "$0")"

echo "Watching for .tex file changes... (Ctrl+C to stop)"
echo "PDF will recompile on every save."

while inotifywait -q -e close_write --include '\.tex$' -r .; do
    echo ""
    echo "--- Change detected, recompiling... ---"
    pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1
    pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1
    echo "--- Done: main.pdf updated ---"
done
