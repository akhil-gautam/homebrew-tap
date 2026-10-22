cask "omp-ui" do
  version "0.8.1"
  sha256 "651db41f360c3f9be8bad92fdb5ab9e4c4277ee24bf0d65a4e4443654f2464a0"

  url "https://github.com/akhil-gautam/omp-ui/releases/download/v#{version}/omp-ui-#{version}.tar.gz"
  name "omp-ui"
  desc "A native macOS app for the omp coding agent"
  homepage "https://github.com/akhil-gautam/omp-ui"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      next unless tag&.start_with?("v")
      tag.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  caveats <<~EOS
    omp-ui is ad-hoc signed and is not Apple-notarized, so the cask removes
    the quarantine flag for it. macOS still may ask you to confirm the first
    launch in System Settings > Privacy & Security.

    omp-ui drives the omp coding agent. If omp is not installed, the app
    offers to install it on first launch, or install it yourself with one of:
      curl -fsSL https://omp.sh/install | sh
      brew install can1357/tap/omp
      bun install -g @oh-my-pi/pi-coding-agent
  EOS

  app "omp-ui.app"

  # The app is ad-hoc signed, so Gatekeeper would otherwise refuse to open
  # it. Homebrew's download is what puts the quarantine flag on it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/omp-ui.app"]
  end

  zap trash: [
    "~/Library/Application Support/omp-ui",
    "~/Library/Application Support/sh.omp.ui",
    "~/Library/Preferences/sh.omp.ui.plist",
    "~/Library/Saved Application State/sh.omp.ui.savedState",
  ]
end
