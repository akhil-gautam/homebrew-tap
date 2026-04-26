class Bloat < Formula
  desc "htop-style disk storage analyzer and cleanup TUI for macOS"
  homepage "https://github.com/akhil-gautam/bloat"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/akhil-gautam/bloat/releases/download/v0.2.1/bloat-v0.2.1-macos-arm64.tar.gz"
      sha256 "8aaa447d0ef8dcdbec153d72d90ff600ef6e17655d9c5d7d83946cf1510eefdb"
    else
      url "https://github.com/akhil-gautam/bloat/releases/download/v0.2.1/bloat-v0.2.1-macos-x86_64.tar.gz"
      sha256 "0803d83cd81f0597a91a78f4de738a8fd5dc38c118ec0e2de89d568d11aab607"
    end
  end

  def install
    bin.install "bloat"
  end

  test do
    assert_match "bloat", shell_output("#{bin}/bloat --version")
  end
end
