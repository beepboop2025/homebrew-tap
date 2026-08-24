class FinancialEvidence < Formula
  desc "Read-only CLI and MCP router for public financial evidence"
  homepage "https://github.com/beepboop2025/financial-evidence-skills"
  url "https://github.com/beepboop2025/financial-evidence-skills/releases/download/v0.1.0/financial_evidence-0.1.0.tar.gz"
  sha256 "2cbf3a050279573a7da050b68e323ce5c5d4519a18065436250b993c30d4149a"
  license "MIT"
  revision 1
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
