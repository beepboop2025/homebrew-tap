class FinancialEvidence < Formula
  desc "Read-only CLI and MCP router for public financial evidence"
  homepage "https://github.com/beepboop2025/financial-evidence-skills"
  url "https://github.com/beepboop2025/financial-evidence-skills/releases/download/v0.1.2/financial_evidence-0.1.2.tar.gz"
  sha256 "5ec485fbb50fa7442f9981c01ec5d7dfe9aa2d3844da79fb55b2cf8efe78dab3"
  license "MIT"
  head "https://github.com/beepboop2025/financial-evidence-skills.git", branch: "main"

  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    site_packages = Language::Python.site_packages("python3.14")
    package = libexec/site_packages/"financial_evidence"
    package.install Dir["src/financial_evidence/*.py"]

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
    chmod 0755, bin/"financial-evidence"
    chmod 0755, bin/"financial-evidence-mcp"

    generate_completions_from_executable(bin/"financial-evidence", "completion")
  end

  test do
    routes = shell_output("#{bin}/financial-evidence route --topic money-market")
    assert_match "https://api.seiche.info/api/v2/money-markets", routes

    request = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"tools/list\",\"params\":{}}\n"
    response = pipe_output(bin/"financial-evidence-mcp", request)
    assert_match "financial_evidence_fetch", response
    assert_match "financial_evidence_route", response
  end
end
