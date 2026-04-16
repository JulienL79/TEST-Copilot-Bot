#!/usr/bin/env bash
# create-item.sh – Create a new FAQ item in this repository.
#
# Usage:
#   ./create-item.sh --title "My question?" --answer "The answer." [--slack-ts "1743670223.000000"]
#
# Options:
#   --title     (required) Title / question text for the FAQ item
#   --answer    (required) Answer body for the FAQ item
#   --slack-ts  (optional) Slack thread timestamp to record in the frontmatter

set -euo pipefail

TITLE=""
ANSWER=""
SLACK_TS=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --title)   TITLE="$2";    shift 2 ;;
    --answer)  ANSWER="$2";   shift 2 ;;
    --slack-ts) SLACK_TS="$2"; shift 2 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "$TITLE" || -z "$ANSWER" ]]; then
  echo "Usage: $0 --title <title> --answer <answer> [--slack-ts <ts>]" >&2
  exit 1
fi

# Build slug: lowercase, transliterate accents, replace non-alphanumeric chars with underscores.
# iconv may not be available or may not support //TRANSLIT on all systems; fall back gracefully.
LOWER=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]')
TRANSLITERATED=$(echo "$LOWER" | iconv -f UTF-8 -t ASCII//TRANSLIT 2>/dev/null) || TRANSLITERATED="$LOWER"
SLUG=$(echo "$TRANSLITERATED" | sed 's/[^a-z0-9]/_/g; s/__*/_/g; s/^_//; s/_$//')

FILE="${SLUG}.md"
NOW=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")

if [[ -f "$FILE" ]]; then
  echo "Error: file '$FILE' already exists. Use update-item to modify an existing entry." >&2
  exit 1
fi

# Escape double-quotes in YAML scalar values so the frontmatter stays valid.
TITLE_ESCAPED="${TITLE//\"/\\\"}"
SLACK_TS_ESCAPED="${SLACK_TS//\"/\\\"}"

cat > "$FILE" <<EOF
---
slack_thread_ts: "${SLACK_TS_ESCAPED}"
title: "${TITLE_ESCAPED}"
created_at: ${NOW}
updated_at: ${NOW}
---

## Question
${TITLE}

## Answer
${ANSWER}
EOF

echo "Created: $FILE"
echo "slug: $SLUG"
echo "file: $FILE"
