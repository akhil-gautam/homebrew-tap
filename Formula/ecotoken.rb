class Ecotoken < Formula
  desc "Environmental impact dashboard for AI coding assistants"
  homepage "https://github.com/akhil-gautam/ecotoken"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/akhil-gautam/ecotoken/releases/download/v0.1.2/ecotoken-aarch64-apple-darwin.tar.gz"
      sha256 "e65884e7e3f77f86978311cd866b2de538e019e0dc272b30bf787094e729b2de"
    else
      url "https://github.com/akhil-gautam/ecotoken/releases/download/v0.1.2/ecotoken-x86_64-apple-darwin.tar.gz"
      sha256 "e3a52d58a9642dc324f3c5aa07665318413dd398252809a45e7879d3bb6d0f88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/akhil-gautam/ecotoken/releases/download/v0.1.2/ecotoken-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af37d4584e6ad0dc9b870222aabacbce151f2834e119998cc617996bdafeda93"
    else
      url "https://github.com/akhil-gautam/ecotoken/releases/download/v0.1.2/ecotoken-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75d48663f9f9b207c1e9cd7f3d9f74c4193decd1febb0ef1a13e3908edbb7be2"
    end
  end

  def install
    bin.install "ecotoken"
  end

  test do
    assert_match "ecotoken", shell_output("#{bin}/ecotoken --version")
  end
end
