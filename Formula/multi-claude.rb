class MultiClaude < Formula
  desc "Run multiple Claude CLI accounts with shared settings and usage history"
  homepage "https://github.com/ghackk/claude-multi-account"
  url "https://github.com/ghackk/claude-multi-account/archive/refs/tags/v1.0.32.tar.gz"
  sha256 "45d7937608d9c6ffb66f7dd1b3b61e21b40b21b2de25c2e38ffc6351573dc55b"
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
