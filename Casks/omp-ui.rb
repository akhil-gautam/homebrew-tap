cask "omp-ui" do
  version "0.1.2"
  sha256 "5c0fd14e0746249f120d999cd215a07301355da4b92d4c12576deefbd5cfdb8d"

  url "https://github.com/akhil-gautam/omp-ui/releases/download/v#{version}/omp-ui_#{version}_aarch64.dmg"
  name "omp-ui"
  desc "Desktop app for omp: many projects open at once, each with its own agent"
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

    omp-ui drives the omp coding agent, which has to be installed separately
    and on your PATH.
  EOS

  app "omp-ui.app"

  # The app is ad-hoc signed, so Gatekeeper would otherwise refuse to open
  # it. Homebrew's download is what puts the quarantine flag on it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/omp-ui.app"]
  end

  zap trash: [
    "~/Library/Application Support/sh.omp.ui",
    "~/Library/Preferences/sh.omp.ui.plist",
    "~/Library/Saved Application State/sh.omp.ui.savedState",
    "~/Library/WebKit/omp-ui",
    "~/Library/WebKit/sh.omp.ui",
  ]
end
