class Mcpctl < Formula
  desc "Magertron MCP Orchestrator CLI"
  homepage "https://magertron.com"
  version "2.0.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-arm64"
      sha256 "89b952305ca094ee7f14c26196a4fb56b1ec897fb72e30748145f2588a39525f"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-amd64"
      sha256 "b1d431395991bec72d29bf2ac9a835b41fcf3fb2bc87dced151e700bb72bdeeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-arm64"
      sha256 "ea24be6f48a40c9b722110338141325605f4da8d9b42eb7d5eb8f70f74df79c0"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-amd64"
      sha256 "62ee522ba3b2cb90e53257d8e74d051a27dc1e757c4ca5eaea21002dfbf3e5ad"
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
