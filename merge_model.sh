#!/usr/bin/env bash
# Reassemble gemma-4-12b-it-qat-q4_0.gguf from its GitHub chunks and verify integrity.
set -euo pipefail

MODEL="gemma-4-12b-it-qat-q4_0.gguf"
DIR="model_chunks"
CHECKSUM_FILE="${MODEL}.sha256"
EXPECTED_SIZE=6975879296

cd "$(dirname "$0")"

if [[ ! -d "$DIR" ]]; then
  echo "ERROR: '$DIR' directory not found. Run this script from the repo root." >&2
  exit 1
fi

echo ">> Merging chunks..."
cat "$DIR"/"${MODEL}".part-* > "$MODEL"

echo ">> Verifying size..."
ACTUAL_SIZE=$(stat -c%s "$MODEL" 2>/dev/null || stat -f%z "$MODEL")
if [[ "$ACTUAL_SIZE" != "$EXPECTED_SIZE" ]]; then
  echo "ERROR: size mismatch (expected $EXPECTED_SIZE, got $ACTUAL_SIZE). Delete the file and re-clone." >&2
  exit 1
fi

echo ">> Verifying SHA-256..."
if command -v sha256sum >/dev/null 2>&1; then
  sha256sum -c "$CHECKSUM_FILE"
else
  shasum -a 256 -c "$CHECKSUM_FILE"
fi

echo ""
echo "Done: $MODEL is ready."
