class Mcpctl < Formula
  desc "Magertron MCP Orchestrator CLI"
  homepage "https://magertron.com"
  version "3.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-arm64"
      sha256 "ced50809dd8716a0efc32b8da77e875be29c954d65d6b11284a66423159b2e5c"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-amd64"
      sha256 "a3a7682067a8c02998f9449dad8792595afcff2ad78fe0fb16f02cf4f8441d32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-arm64"
      sha256 "c7a0b598f982f9c27fa667c5fba76616d1ec672bd63a1a1b9fb1977b1afb5de8"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-amd64"
      sha256 "91e7a3ce1ec124d83f9197df63ae76ef8800301e76509c158f0558a316defac6"
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
