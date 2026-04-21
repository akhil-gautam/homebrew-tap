class Tokscale < Formula
  desc "Proactive insights for AI coding assistants (Claude Code, Codex, Gemini, OpenCode)"
  homepage "https://github.com/akhil-gautam/toktracker"
  url "https://registry.npmjs.org/tokscale/-/tokscale-0.2.0.tgz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
