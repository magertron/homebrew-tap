class Mcpctl < Formula
  desc "Magertron MCP Orchestrator CLI"
  homepage "https://magertron.com"
  version "2.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-arm64"
      sha256 "0f84d1b080ec482983dd5d85a10b0582ea3681349df2c7a4d22c73503c97196c"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-amd64"
      sha256 "f1418792a2f1ff1edf89def8f3ca6c9db1dd8848a8da20e87ecf2209d425b65b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-arm64"
      sha256 "ee4a0b4bf352163dce6b070180ab06bcead3bafaccf037466e3d331b777ad0e5"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-amd64"
      sha256 "498a66326128764ec14470a20ae7ac038c99d374f7217534090e09d77b13273e"
    end
  end

  def install
    # The downloaded asset is a bare binary whose filename matches the URL
    # (e.g. "mcpctl-linux-amd64"). Find it in the staging dir and install
    # it as just "mcpctl".
    binary = Dir.glob("mcpctl-*").first
    odie "Could not locate downloaded mcpctl binary" if binary.nil?
    bin.install binary => "mcpctl"
  end

  test do
    # Verify the binary runs and reports the expected version.
    assert_match "mcpctl v#{version}", shell_output("#{bin}/mcpctl version")
  end
end
