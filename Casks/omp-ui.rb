cask "omp-ui" do
  version "0.9.6"
  sha256 "1527c21cc5fbc60ab7a1bd2fdd2ed2db94d0dff820806ba73413cc61e6843da3"

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
