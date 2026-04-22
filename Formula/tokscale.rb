class Tokscale < Formula
  desc "Proactive insights for AI coding assistants (Claude Code, Codex, Gemini, OpenCode)"
  homepage "https://github.com/akhil-gautam/toktracker"
  url "https://registry.npmjs.org/toktracker/-/toktracker-0.2.1.tgz"
  sha256 "05f590ab7a8dd60a560d08dbaeb3dabc48dc13475c52b6c57051cec1e81106bd"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/tokscale --version"))
  end
end
