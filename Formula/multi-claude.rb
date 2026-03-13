class MultiClaude < Formula
  desc "Run multiple Claude CLI accounts with shared settings and plugins"
  homepage "https://github.com/ghackk/claude-multi-account"
  url "https://github.com/ghackk/claude-multi-account/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "eb1a989f7d39271554d888df35a6229943da8b79609f39c30119e8812d10592c"
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
