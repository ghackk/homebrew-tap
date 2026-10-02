class MultiClaude < Formula
  desc "Run multiple Claude CLI accounts with shared settings and usage history"
  homepage "https://github.com/ghackk/claude-multi-account"
  url "https://github.com/ghackk/claude-multi-account/archive/refs/tags/v1.0.27.tar.gz"
  sha256 "7011ed75bab71aaf6e2fbe55261c37f678c4c60b8105f661e1ca97904e20c8c0"
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
