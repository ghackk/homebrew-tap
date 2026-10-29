class MultiClaude < Formula
  desc "Run multiple Claude CLI accounts with shared settings and usage history"
  homepage "https://github.com/ghackk/claude-multi-account"
  url "https://github.com/ghackk/claude-multi-account/archive/refs/tags/v1.0.36.tar.gz"
  sha256 "3e938d074adabb7f616b44a3e73bc3dd0add6615d2c74729859e01f75e206474"
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
