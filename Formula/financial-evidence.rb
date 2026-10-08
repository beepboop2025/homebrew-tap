class FinancialEvidence < Formula
  desc "Read-only CLI and MCP router for public financial evidence"
  homepage "https://github.com/beepboop2025/financial-evidence-skills"
  url "https://github.com/beepboop2025/financial-evidence-skills/releases/download/v0.1.7/financial_evidence-0.1.7.tar.gz"
  sha256 "aa8af511284f463cd08c63b435ba073cc29de9dba3ff1378468aec18668e827d"
  license "MIT"
  head "https://github.com/beepboop2025/financial-evidence-skills.git", branch: "main"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    site_packages = Language::Python.site_packages("python3.14")
    package = libexec/site_packages/"financial_evidence"
    package.install Dir["src/financial_evidence/*.py"]
    package.install "src/financial_evidence/runtime"

    (bin/"financial-evidence").write <<~SH
      #!/bin/bash
      export PYTHONPATH="#{libexec/site_packages}${PYTHONPATH:+:$PYTHONPATH}"
      exec "#{python}" -m financial_evidence "$@"
    SH
    (bin/"financial-evidence-mcp").write <<~SH
      #!/bin/bash
      export PYTHONPATH="#{libexec/site_packages}${PYTHONPATH:+:$PYTHONPATH}"
      exec "#{python}" -m financial_evidence.mcp "$@"
    SH
    (bin/"financial-evidence-runtime").write <<~SH
      #!/bin/bash
      export PYTHONPATH="#{libexec/site_packages}${PYTHONPATH:+:$PYTHONPATH}"
      exec "#{python}" -m financial_evidence.runtime.cli "$@"
    SH
    chmod 0755, bin/"financial-evidence"
    chmod 0755, bin/"financial-evidence-mcp"
    chmod 0755, bin/"financial-evidence-runtime"

    generate_completions_from_executable(bin/"financial-evidence", "completion")
  end

  test do
    topics = %w[money-market capital-market china-economy bank-risk market-liquidity gift-city forex gold]
    assert_match version.to_s, shell_output("#{bin}/financial-evidence --version")
    listed = JSON.parse(shell_output("#{bin}/financial-evidence topics --format json"))
    assert_equal topics.sort, listed.fetch("topics").map { |topic| topic.fetch("topic") }.sort

    runtime = JSON.parse(shell_output("#{bin}/financial-evidence-runtime catalog"))
    assert_equal "financial-evidence.runtime-capabilities.v1", runtime.fetch("schema")
    state = testpath/"research-state"
    runtime_command = "#{bin}/financial-evidence-runtime --root #{state}"
    report = JSON.parse(shell_output("#{runtime_command} init --traffic-class synthetic"))
    assert_equal "synthetic", report.fetch("traffic_class")
    assert_nil report.fetch("external_active_users")
    assert_path_exists state/"runtime.sqlite"

    routes = JSON.parse(shell_output("#{bin}/financial-evidence route --topic #{topics.join(",")}"))
    assert_equal topics.sort, routes.fetch("topics").keys.sort
    {
      "money-market" => "https://api.seiche.info/api/v2/money-markets",
      "gift-city"    => "https://api.seiche.info/api/v2/gift-city",
      "forex"        => "https://api.seiche.info/api/v2/world-markets?section=forex",
      "gold"         => "https://api.seiche.info/api/v2/gift-city",
    }.each do |topic, url|
      assert_includes routes.fetch("topics").fetch(topic).map { |source| source.fetch("url") }, url
    end

    requests = [
      {
        id:     1,
        method: "initialize",
        params: {
          protocolVersion: "2025-11-25",
          capabilities:    {},
          clientInfo:      { name: "homebrew-test", version: "1" },
        },
      },
      { id: 2, method: "server/discover", params: {} },
      { id: 3, method: "tools/list", params: {} },
      { id: 4, method: "tools/call", params: { name: "financial_evidence_route", arguments: { topics: } } },
    ].map { |request| { jsonrpc: "2.0", **request }.to_json }.join("\n") + "\n"
    responses = pipe_output(bin/"financial-evidence-mcp", requests, 0).lines.map { |line| JSON.parse(line) }
    assert_equal [1, 2, 3, 4], responses.map { |response| response.fetch("id") }
    assert_equal "2025-11-25", responses[0].fetch("result").fetch("protocolVersion")
    responses.first(2).each do |response|
      assert_equal version.to_s, response.fetch("result").fetch("serverInfo").fetch("version")
    end
    assert_includes responses[1].fetch("result").fetch("supportedVersions"), "2026-07-28"

    tools = responses[2].fetch("result").fetch("tools")
    assert_equal %w[financial_evidence_fetch financial_evidence_route financial_evidence_topics],
                 tools.map { |tool| tool.fetch("name") }.sort
    tools.reject { |tool| tool.fetch("name") == "financial_evidence_topics" }.each do |tool|
      schema = tool.fetch("inputSchema").fetch("properties").fetch("topics")
      assert_equal topics.sort, schema.fetch("items").fetch("enum").sort
      assert_equal 8, schema.fetch("maxItems")
    end
    routed = responses[3].fetch("result")
    assert_equal false, routed.fetch("isError")
    assert_equal routes, routed.fetch("structuredContent")
  end
end
