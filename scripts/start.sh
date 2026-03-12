#!/bin/bash
set -e

echo "Authenticating Atlassian CLI non-interactively..."

# The official Atlassian CLI method for CI/CD pipelines:
# We pipe the token via standard input so the CLI doesn't hang waiting for a user prompt.
echo "$ATLASSIAN_API_TOKEN" | acli rovodev auth login \
  --email "$ATLASSIAN_EMAIL" \
  --token

# (Optional) Pre-configure Rovo settings for OpenClaw agents
# e.g., enforcing markdown output so the LLM can read it easily
# acli rovodev config set outputFormat markdown

echo "Atlassian CLI authenticated. Starting OpenClaw..."

# Execute the main OpenClaw process
exec node src/server.js
