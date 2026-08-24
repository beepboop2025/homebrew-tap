class LiquilensEvidence < Formula
  include Language::Python::Virtualenv

  desc "Issue, verify, and project portable financial evidence carriers"
  homepage "https://liquilens.in/protocol/"
  url "https://github.com/beepboop2025/liquilens-evidence-carrier/releases/download/v0.13.6/liquilens_evidence-0.13.6.tar.gz"
  sha256 "63ccb12e6d82c34e546ba4fe11058d5aee216a70bd8f9fa96335a4cc9d5bfd6c"
  license "Apache-2.0"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources

    # Homebrew removes Python RECORD files, so expose the installed protocol
    # artifacts through the package's source-layout fallback as well.
    protocol_fallback = (libexec/Language::Python.site_packages("python3.14")).parent/"protocol"
    protocol_fallback.make_relative_symlink libexec/"share/liquilens_evidence/protocol"
  end

  test do
    (testpath/"descriptor.json").write <<~JSON
      {
        "producer": {
          "name": "liquilens",
          "version": "#{version}",
          "endpoint": "https://liquilens.in/protocol/"
        },
        "subject": {
          "kind": "protocol_artifact",
          "name": "LiquiLens Evidence Carrier v1",
          "identifiers": {"schema": "liquilens-evidence-carrier-v1"}
        },
        "claim": {
          "kind": "conformance_example",
          "summary": "Homebrew formula test",
          "status": "structural"
        },
        "clocks": {
          "event_time": "2026-08-24T11:26:45Z",
          "knowledge_time": "2026-08-24T11:26:45Z",
          "as_of": "2026-08-24T11:26:46Z",
          "expires_at": "2030-01-01T00:00:00Z"
        },
        "sources": [{
          "source_id": "liquilens:evidence-carrier-schema:v1",
          "publisher": "LiquiLens",
          "title": "LiquiLens Evidence Carrier v1 JSON Schema",
          "url": "https://liquilens.in/protocol/liquilens-evidence-carrier-v1.schema.json",
          "retrieved_at": "2026-08-24T11:26:45Z",
          "content_sha256": "7f8494d8470853dc88665ea32c1dccb40cc58c55b07e9267aa28c81f83c1ccd3"
        }],
        "rights": {
          "status": "licensed",
          "permissions": ["ingest", "derive", "display", "redistribute"],
          "license": "Apache-2.0",
          "license_url": "https://github.com/beepboop2025/liquilens-evidence-carrier/blob/main/LICENSE",
          "attribution": "LiquiLens Evidence Carrier contributors",
          "jurisdictions": ["global"]
        },
        "payload": {
          "protocol": "liquilens-evidence-carrier-v1",
          "purpose": "Homebrew conformance test"
        },
        "extensions": {}
      }
    JSON

    carrier = shell_output("#{bin}/liquilens-evidence issue descriptor.json")
    assert_match '"carrier_id": "evidence_', carrier
    (testpath/"carrier.json").write carrier

    verification = shell_output("#{bin}/liquilens-evidence verify carrier.json --as-of 2026-08-25T00:00:00Z")
    assert_match '"ok": true', verification

    system libexec/"bin/python", "-c",
           "from liquilens_evidence.protocol_resources import protocol_path; " \
           "assert protocol_path('liquilens-evidence-carrier-v1.schema.json').is_file()"
  end
end
