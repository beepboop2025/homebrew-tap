# Liquidity Lab Homebrew Tap

Self-owned Homebrew formulae for public, read-only financial infrastructure.

## Financial Evidence

Install the terminal and MCP router for LiquiLens, Undertow, Seiche, and
Palimpsest:

```bash
brew install beepboop2025/tap/financial-evidence
financial-evidence topics
financial-evidence fetch --topic money-market --topic china-economy
```

Homebrew installs Bash, Zsh, and Fish completions automatically. The companion
`financial-evidence-mcp` executable runs the same fixed-route evidence layer as
a local stdio MCP server.

The formula is built from the immutable `v0.1.0` source release and verifies
its SHA-256 before installation. It has no runtime Python package dependencies
and makes read-only requests only to fixed public HTTPS routes.
