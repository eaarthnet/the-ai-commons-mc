#!/bin/bash
# Two-remote push script for EAARTHNET mirroring
# Usage: ./scripts/push-all.sh

set -e

echo "=== EAARTHNET Mirror Push ==="
echo ""

echo "Pushing to origin (GitHub)..."
if git push origin main; then
    echo "✅ GitHub synced"
else
    echo "❌ GitHub push failed"
    exit 1
fi

echo ""
echo "Pushing to codeberg..."
if git push codeberg main --force-with-lease; then
    echo "✅ Codeberg synced"
else
    echo "❌ Codeberg push failed"
    exit 1
fi

echo ""
echo "=== Both mirrors synchronized ==="

# Verification
ORIGIN_HASH=$(git rev-parse origin/main)
CODEBERG_HASH=$(git rev-parse codeberg/main)

if [ "$ORIGIN_HASH" = "$CODEBERG_HASH" ]; then
    echo "✅ Commit hashes match: $ORIGIN_HASH"
else
    echo "⚠️  WARNING: Divergence detected!"
    echo "    GitHub: $ORIGIN_HASH"
    echo "    Codeberg: $CODEBERG_HASH"
    exit 1
fi
