class Toktracker < Formula
  desc "Proactive insights for AI coding assistants (Claude Code, Codex, Gemini, OpenCode)"
  homepage "https://github.com/akhil-gautam/toktracker"
  url "https://registry.npmjs.org/toktracker/-/toktracker-0.2.2.tgz"
  sha256 "05badc76bbadd7ca30187acb37d7fe0f9c7f5b1ee1ecd8affcb738c791cbb92f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/toktracker --version"))
  end
end
