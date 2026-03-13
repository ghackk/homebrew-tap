class MultiClaude < Formula
  desc "Run multiple Claude CLI accounts with shared settings and plugins"
  homepage "https://github.com/ghackk/claude-multi-account"
  url "https://github.com/ghackk/claude-multi-account/archive/refs/tags/v1.0.9.tar.gz"
  sha256 "4e0f5fe24992f1a2b004b71ab0a45ddddcc606a52ae7e39395a0285c055a3176"
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
