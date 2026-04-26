class Bloat < Formula
  desc "htop-style disk storage analyzer and cleanup TUI for macOS"
  homepage "https://github.com/akhil-gautam/bloat"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/akhil-gautam/bloat/releases/download/v0.2.0/bloat-v0.2.0-macos-arm64.tar.gz"
      sha256 "f4d21d042513f19790e9c9fd650ab5da3892acbfaf2952a86ba86c9ccb5612ab"
    else
      url "https://github.com/akhil-gautam/bloat/releases/download/v0.2.0/bloat-v0.2.0-macos-x86_64.tar.gz"
      sha256 "55a81c03c9d5f791f55c28a961a3f134968cd490d145c7048d0299357a59770f"
    end
  end

  def install
    bin.install "bloat"
  end

  test do
    assert_match "bloat", shell_output("#{bin}/bloat --version")
  end
end
