class FinancialEvidence < Formula
  include Language::Python::Virtualenv

  desc "Read-only CLI and MCP router for public financial evidence"
  homepage "https://github.com/beepboop2025/financial-evidence-skills"
  url "https://github.com/beepboop2025/financial-evidence-skills/releases/download/v0.1.8/financial_evidence-0.1.8.tar.gz"
  sha256 "7165c192628555e9c76f832f2e87ad7d39d2a71530fac96b3d8dc0b7552baa91"
  license "MIT"
  head "https://github.com/beepboop2025/financial-evidence-skills.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "libffi"
  depends_on "openssl@3"
  depends_on "python@3.14"

  pypi_packages package_name: "financial-evidence[workspace]"

  resource "annotated-doc" do
    url "https://files.pythonhosted.org/packages/5a/8e/38aa427ed5402449e226975b649c5dc73ccadfefeb95e6aecb8f8ea4b6b6/annotated_doc-0.0.5.tar.gz"
    sha256 "c7e58ce09192557605d8bbd92836d7e1d520ac9580096042c0bfd197efacf1bb"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/5f/56/a8120250d128bed162cd73c76d45f6ef9991f3e068f62a8ee060afa3104a/annotated_types-0.8.0.tar.gz"
    sha256 "13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a561055cac8f64cab7"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/a9/d2/f4d173e22df740bc37b1db102b386ba719b66e95b0f0d751f556b387e6d2/anyio-4.15.1.tar.gz"
    sha256 "9f28306018cbd6d329e64a36d58256edff76dd996fe423bc957326e578b82a94"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/9a/8e/82a0fe20a541c03148528be8cac2408564a6c9a0cc7e9171802bc1d26985/attrs-26.1.0.tar.gz"
    sha256 "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a/certifi-2026.7.22.tar.gz"
    sha256 "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/9e/ef/008a1939e372c06329a3fce4279c02f328488f3526744906eeec3da7ad5f/cffi-2.1.1.tar.gz"
    sha256 "dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/c7/0e/7fa0ef50764b67090eca4114772a2abf8b6148198475e54c660b97caeee6/click-8.5.0.tar.gz"
    sha256 "ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/9d/af/182eb91b0df3fe75c4d9f26fe70684569566745f6ba7e5c9c73a862c5252/cryptography-50.0.2.tar.gz"
    sha256 "7b46165bb56eb4704e2eaaf86f3c940d19154535d9b0ca7d6d590b04060e00d5"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/0b/d7/6a8753ab6c1d432dc53703c3e1b92974a94531b7d047c32bbaae461ea844/fastapi-0.143.0.tar.gz"
    sha256 "1acffe48206a80917cf7dac21992b5c44b25384e8902bf745c1fd9dabcf6c51f"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "httpx-sse" do
    url "https://files.pythonhosted.org/packages/0f/4c/751061ffa58615a32c31b2d82e8482be8dd4a89154f003147acee90f2be9/httpx_sse-0.4.3.tar.gz"
    sha256 "9b1ed0127459a66014aec3c56bebd93da3c1bc8bb6618c8082039a44889a755d"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa/idna-3.20.tar.gz"
    sha256 "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/b3/fc/e067678238fa451312d4c62bf6e6cf5ec56375422aee02f9cb5f909b3047/jsonschema-4.26.0.tar.gz"
    sha256 "0c26707e2efad8aa1bfc5b7ce170f3fccc2e4918ff85989ba9ffa9facb2be326"
  end

  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/19/74/a633ee74eb36c44aa6d1095e7cc5569bebf04342ee146178e2d36600708b/jsonschema_specifications-2025.9.1.tar.gz"
    sha256 "b540987f239e745613c7a9176f3edb72b832a4ac465cf02712288397832b5e8d"
  end

  resource "mcp" do
    url "https://files.pythonhosted.org/packages/ba/93/0142dc84a666daf8ad51a34268f34c12fd6fda4f3810c4be2504eecc8212/mcp-1.30.0.tar.gz"
    sha256 "445414625fce5c295faa505bb11bacece661ab6f4028d57c935db57820b7a3e4"
  end

  resource "opentelemetry-api" do
    url "https://files.pythonhosted.org/packages/2e/02/6e0ae9cc61bd3169d401077b507b3ebc344745171e1051ab430be012dcd9/opentelemetry_api-1.45.1.tar.gz"
    sha256 "aa38ed19bcc084ba42782a73255b3582283eced7ad6dddbd6695189e69adfb75"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/da/a8/c5fdbeee588bb8ada9458774f43adf1bdd30bd59157055142183e769a024/pycparser-3.11.tar.gz"
    sha256 "d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2f1c2935e97c2bc"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/7c/0b/8e10b2e693af8ec54346a14caf36221334775975a747c9ceaa3f8371d96d/pydantic-2.14.1.tar.gz"
    sha256 "94f478203dd03404682a1ada216965651dd74b1d2d5ffd62e00e0837caab5c26"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/a6/24/af4ec4be49fbc810f35b0bdcacc3d433b56bbfa469fd3bfd4ae116cd9bf1/pydantic_core-2.50.1.tar.gz"
    sha256 "e50d7b94baac6c7d09927fa5ca5800a0c7ee5015c7fcff65beb3a1931b5a6e09"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/68/ca/31c57507b13119d7d3cfa1576dad2911a4861e3be07b579395f4e9d393f9/pydantic_settings-2.15.0.tar.gz"
    sha256 "694b793e84f766ba76a90ebdefc01d0a9a045dab0382bee70393da93712ad117"
  end

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/43/ea/5194e52748b0da83d71e082d75496eaec6e58f419f5e184786ded517e6a9/pyjwt-2.15.1.tar.gz"
    sha256 "4f259e80cdfb6b3fc18a7de51fd1ef9ec79652f25019bae68975ca2468a34df8"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/74/26/2fbeedb218a787a5eea551c7532cac4e009f83d689dd2faa0d0353473f86/python_dotenv-1.2.4.tar.gz"
    sha256 "f0d53e69935a851c0dcc78f3ab7aaccd8cabef0b92382b576b824212902873c0"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/5b/42/55c32bb9b12693c092ad250a0e82edb5b31ddeda6eb772de5f308b3804ad/python_multipart-0.0.32.tar.gz"
    sha256 "be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e"
  end

  resource "referencing" do
    url "https://files.pythonhosted.org/packages/22/f5/df4e9027acead3ecc63e50fe1e36aca1523e1719559c499951bb4b53188f/referencing-0.37.0.tar.gz"
    sha256 "44aefc3142c5b842538163acb373e24cce6632bd54bdb01b21ad5863489f50d8"
  end

  resource "rpds-py" do
    url "https://files.pythonhosted.org/packages/42/68/3bd46b8a5e01d3c2ebdf9c5e9497912e3fe0cde02bac21a7130ca866e403/rpds_py-2026.9.1.tar.gz"
    sha256 "4793ef7f78268b124b73fa933440f01d258bbae01de9fa53e9080c9ab0425a12"
  end

  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/e4/be/0123026f719d1a7936f214a88b553bb5701e04ff2511147c1dab0c5035eb/sse_starlette-3.5.0.tar.gz"
    sha256 "75de713aa8a9441513cc283220826da079d982770965b951e9437720e8bafdb2"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/7b/2b/3850dc6bf7ef71b088962eba31dafc6cffd2f96e577ebb0bb316df96da3e/starlette-1.7.0.tar.gz"
    sha256 "c79f74ea63cff761804fbbfb182f1e0b440c2d07b164d24700c5a1bab5d6ff5d"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/a3/26/b09b8010994eccc3c09092e6b34058f36a460eea2d4c3e8b910c695975a0/typing_inspection-0.4.4.tar.gz"
    sha256 "547274fa6b0a561ccf549cc9524b999a578e737d015d8709d021f9d0d13bea47"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/da/34/30e9280707135d2cfc589dfff3cb796bd07a3aeb1a3e415ba09dd89d7bb4/uvicorn-0.54.0.tar.gz"
    sha256 "a2e33cbfaa0306f8e6b0c13e0cb89d7d7a2da3e62b90c66e18c33d9807b28620"
  end

  def install
    ENV["OPENSSL_DIR"] = formula_opt_prefix("openssl@3")
    virtualenv_install_with_resources
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

    products = JSON.parse(shell_output("#{bin}/financial-evidence-trading catalog"))
    assert_includes products.map { |product| product.fetch("id") }, "seiche"
    products.each do |product|
      assert_equal "https://agents.seiche.info/products/#{product.fetch("id")}/mcp", product.fetch("mcp_url")
      assert_equal true, product.fetch("free_core")
      assert_equal "off", product.fetch("optional_learning_default")
    end
    config = JSON.parse(shell_output("#{bin}/financial-evidence-trading mcp-config"))
    assert_equal products.map { |product| product.fetch("id") }.sort, config.fetch("mcpServers").keys.sort

    learning_state = testpath/"learning-state"
    learning = JSON.parse(shell_output("#{bin}/financial-evidence-learning --store #{learning_state} report"))
    assert_equal 0, learning.fetch("enrolled_tenants")
    assert_equal 0, learning.fetch("requests")
    assert_nil learning.fetch("distinct_organisations")
    assert_path_exists learning_state/"learning.sqlite"

    # Loading every published entry point catches missing subpackages and optional dependencies.
    (testpath/"installed_workspace.py").write <<~PYTHON
      import asyncio
      import json
      from importlib.metadata import distribution
      from pathlib import Path
      import httpx
      from financial_evidence.workspace import create_app

      expected = {
          "financial-evidence", "financial-evidence-mcp", "financial-evidence-api",
          "financial-evidence-workspace-mcp", "financial-evidence-agent-mcp",
          "financial-evidence-runtime", "financial-evidence-runtime-mcp",
          "financial-evidence-learning", "financial-evidence-trading",
          "seiche-network-client-mcp", "financial-evidence-product-mcp",
      }
      entries = {entry.name: entry for entry in distribution("financial-evidence").entry_points
                 if entry.group == "console_scripts"}
      assert set(entries) == expected
      for name, entry in entries.items():
          assert Path("#{bin}", name).is_file(), name
          assert callable(entry.load()), name

      async def check_workspace():
          app = create_app()
          transport = httpx.ASGITransport(app=app)
          async with httpx.AsyncClient(transport=transport, base_url="http://127.0.0.1:6900") as client:
              response = await client.get("/api/v1/datasets")
              assert response.status_code == 200
              catalog = response.json()
              assert "money_markets" in json.dumps(catalog)
      asyncio.run(check_workspace())
      print("INSTALLED_WORKSPACE_PASS")
    PYTHON
    assert_match "INSTALLED_WORKSPACE_PASS", shell_output("#{libexec}/bin/python #{testpath}/installed_workspace.py")

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
