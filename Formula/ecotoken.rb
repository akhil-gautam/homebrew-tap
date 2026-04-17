class Ecotoken < Formula
  desc "Environmental impact dashboard for AI coding assistants"
  homepage "https://github.com/akhil-gautam/ecotoken"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/akhil-gautam/ecotoken/releases/download/v0.1.1/ecotoken-aarch64-apple-darwin.tar.gz"
      sha256 "fa38ee773ff9c4f5b76f1daa1677c22aed09655300288fc65aca3382495959c0"
    else
      url "https://github.com/akhil-gautam/ecotoken/releases/download/v0.1.1/ecotoken-x86_64-apple-darwin.tar.gz"
      sha256 "b063782a7f0f895b8d4b1b09ef8ea65d16ec8d4531ee2c5d33ca2a8e37a59b9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/akhil-gautam/ecotoken/releases/download/v0.1.1/ecotoken-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe7edc73cba5e5f05122f096e640eafb90f6cd2c92c495da4b0819b264eecaf7"
    else
      url "https://github.com/akhil-gautam/ecotoken/releases/download/v0.1.1/ecotoken-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6b38831d71cb6ca6bfe2e014145ba03e89fd0e03749035c3681cecde1c99c6b"
    end
  end

  def install
    bin.install "ecotoken"
  end

  test do
    assert_match "ecotoken", shell_output("#{bin}/ecotoken --version")
  end
end
