class MultiClaude < Formula
  desc "Run multiple Claude CLI accounts with shared settings and plugins"
  homepage "https://github.com/ghackk/claude-multi-account"
  url "https://github.com/ghackk/claude-multi-account/archive/refs/tags/v1.0.24.tar.gz"
  sha256 "c99ef73b8ca8a70a2e92e1eb021f91df051d362f8955928287b9397404cab8cd"
  license "MIT"

  head "https://github.com/ghackk/claude-multi-account.git", branch: "master"

  def install
    libexec.install Dir["*"]
    (bin/"multi-claude").write_env_script libexec/"unix/claude-menu.sh"
  end

  test do
    assert_predicate bin/"multi-claude", :exist?
  end
end
