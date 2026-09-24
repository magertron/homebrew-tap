class Mcpctl < Formula
  desc "Magertron MCP Orchestrator CLI"
  homepage "https://magertron.com"
  version "3.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-arm64"
      sha256 "ecd105f494c2eb7f6a3e915bf9fe094918c71204a6df698c792b9b52b84de5d7"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-darwin-amd64"
      sha256 "2e6dd621de1ba0443eabdf24a298323913ed784068b95aeff5a5d748c30fac7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-arm64"
      sha256 "4316112f61bf39008ac7a175c4664fc703026eee82c9ebcc0f5f8a3f386a3584"
    end
    on_intel do
      url "https://github.com/magertron/orchestrator/releases/download/v#{version}/mcpctl-linux-amd64"
      sha256 "2181aacb3e94342fbb01976efb2a5b9dcd82117b8aa79eb072f8e885d3471e66"
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
