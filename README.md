# Liquidity Lab Homebrew Tap

Self-owned Homebrew formulae for public, read-only financial infrastructure.

## LiquiLens Evidence Carrier

Install the CLI for issuing, verifying, and projecting portable financial
evidence carriers:

```bash
brew install beepboop2025/tap/liquilens-evidence
liquilens-evidence issue descriptor.json > carrier.json
liquilens-evidence verify carrier.json --as-of 2026-08-25T00:00:00Z
```

The formula is built from the immutable `v0.13.6` Python source distribution
and verifies its SHA-256 before installation. The CLI has no third-party Python
runtime dependencies.

## Financial Evidence

Install the terminal, hosted product clients, and MCP tools:

```bash
brew install beepboop2025/tap/financial-evidence
financial-evidence topics
financial-evidence-trading catalog
financial-evidence fetch --topic money-market --topic china-economy
```

Upgrade an existing installation:

```bash
brew update
brew upgrade beepboop2025/tap/financial-evidence
financial-evidence --version
```

Homebrew installs Bash, Zsh, and Fish completions automatically. The companion
`financial-evidence-mcp` executable runs the same fixed-route evidence layer as
a local stdio MCP server. Requests use the hosted central service at
`https://agents.seiche.info`; original publisher URLs remain in provenance.
Hosted failures remain visible and do not trigger a direct-source fallback.

Run `financial-evidence-trading mcp-config` for the hosted product connections.
Version 0.1.9 includes persistent Python MCP sessions, source-status snapshots
and SSE clients. Use `financial-evidence-trading doctor` to check the connection
and `financial-evidence-trading context` to inspect source-status metadata.
The package-name command `financial-evidence mcp` also starts the stdio router.
The installation also includes the workspace REST/MCP commands, product and
network MCP bridges, research runtime, and explicit learning administration.
Installing or listing tools does not enroll an agent in optional learning or
start a background service. Product requests reach the hosted service, where
bounded product, tool, and dataset demand is measured.

The formula verifies the immutable source release and every pinned Python
dependency by SHA-256. Its isolated Python environment includes the upstream
`workspace` dependencies required by all 11 published commands; it includes
the full package, including the trading and learning modules. The optional
OpenBB Python provider is a separate upstream extra; follow the
[OpenBB setup instructions](https://github.com/beepboop2025/financial-evidence-skills#readme)
when embedding that provider in an OpenBB environment.

Eight topics are available: money markets, capital markets, China economy,
bank risk, market liquidity, GIFT City, forex, and gold. The last three route to
bounded Seiche public evidence; they do not provide executable FX or gold quotes.
