class MultiClaude < Formula
  desc "Run multiple Claude CLI accounts with shared settings and plugins"
  homepage "https://github.com/ghackk/claude-multi-account"
  url "https://github.com/ghackk/claude-multi-account/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "9c6d2f47e1341717381f0cf8c808699d61ef170a7d9ef312c82a9d66965988a1"
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
