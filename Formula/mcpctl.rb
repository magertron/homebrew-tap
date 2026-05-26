class Mcpctl < Formula
  desc "Magertron MCP Orchestrator CLI"
  homepage "https://magertron.com"
  version "2.0.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-arm64"
      sha256 "24163568fa5030e828420863037eb514674e4d011b9c03638051858f3ebf1d79"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-amd64"
      sha256 "18d3e9e5f21d22fe316af091dcc51553b26e2489d4b1a1fb226d70bfbc36e348"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-arm64"
      sha256 "09992825555a4b714ce22465a9f078ded999dd42fdbf698c821d7e64d161bc18"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-amd64"
      sha256 "4a42e20cba76aa268d7da2767f63113d683de47daf1c6be38e01b358c2f8f056"
    end
  end

  def install
    binary = Dir.glob("mcpctl-*").first
    odie "Could not locate downloaded mcpctl binary" if binary.nil?
    bin.install binary => "mcpctl"
  end

  test do
    assert_match "mcpctl v#{version}", shell_output("#{bin}/mcpctl version")
  end
end
