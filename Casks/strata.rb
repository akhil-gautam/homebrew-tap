cask "strata" do
  version "0.3.0"
  sha256 "c5bc61e79d8ae6be520e0c23c60579ed142fca9e7f11392d827e099307724cbd"

  url "https://github.com/akhil-gautam/strata/releases/download/v#{version}/Strata-#{version}.zip"
  name "Strata"
  desc "Widget bar that takes the Dock's place"
  homepage "https://github.com/akhil-gautam/strata"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      next unless tag&.start_with?("v")

      tag.delete_prefix("v")
    end
  end

  depends_on macos: :tahoe

  app "Strata.app"

  # Not notarized, so Gatekeeper would otherwise refuse to open it. Homebrew's
  # download is what puts the quarantine flag on it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Strata.app"]
  end

  # Quitting lets Strata restore the macOS Dock's own auto-hide setting.
  # Strata was called Shelfie and DockDock and kept its bundle id.
  uninstall quit: "app.dockdock.DockDock"

  zap trash: [
    "~/Library/Application Support/DockDock",
    "~/Library/Application Support/Shelfie",
    "~/Library/Application Support/Strata",
    "~/Library/Preferences/app.dockdock.DockDock.plist",
    "~/Library/Saved Application State/app.dockdock.DockDock.savedState",
  ]

  caveats <<~EOS
    Strata (formerly Shelfie and DockDock) is signed with a Developer ID but
    is not Apple-notarized yet, so the cask removes the quarantine flag for
    it. macOS still may ask you to confirm the first launch in
    System Settings > Privacy & Security.
  EOS
end
