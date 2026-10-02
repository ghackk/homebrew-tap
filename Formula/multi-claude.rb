class MultiClaude < Formula
  desc "Run multiple Claude CLI accounts with shared settings and usage history"
  homepage "https://github.com/ghackk/claude-multi-account"
  url "https://github.com/ghackk/claude-multi-account/archive/refs/tags/v1.0.31.tar.gz"
  sha256 "80ba4cfa91917cc82c98e22e05ebd9a1bcbd1baabf1c095b5671ad77c8e58892"
  license "MIT"

  head "https://github.com/ghackk/claude-multi-account.git", branch: "master"
  depends_on "node"
  depends_on "jq"
  depends_on "python@3.14"

  def install
    libexec.install Dir["*"]
    (libexec/"unix/claude-menu.sh").chmod 0755
    (bin/"multi-claude").write_env_script libexec/"unix/claude-menu.sh"
  end

  test do
    assert_predicate bin/"multi-claude", :exist?
    assert_predicate libexec/"usage/report.js", :exist?
  end
end
