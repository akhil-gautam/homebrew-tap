cask "shelfie" do
  version "0.2.0"
  sha256 "4dc46f88b9aaf1794efa620a633289f1f1ae7d744770e53a284b26372dbe7078"

  url "https://github.com/akhil-gautam/shelfie/releases/download/v#{version}/Shelfie-#{version}.zip"
  name "Shelfie"
  desc "Widget bar that takes the Dock's place"
  homepage "https://github.com/akhil-gautam/shelfie"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      next unless tag&.start_with?("v")

      tag.delete_prefix("v")
    end
  end

  depends_on macos: :tahoe

  app "Shelfie.app"

  # Not notarized, so Gatekeeper would otherwise refuse to open it. Homebrew's
  # download is what puts the quarantine flag on it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Shelfie.app"]
  end

  # Quitting lets Shelfie restore the macOS Dock's own auto-hide setting.
  # Shelfie was called DockDock and kept its bundle id.
  uninstall quit: "app.dockdock.DockDock"

  zap trash: [
    "~/Library/Application Support/DockDock",
    "~/Library/Application Support/Shelfie",
    "~/Library/Preferences/app.dockdock.DockDock.plist",
    "~/Library/Saved Application State/app.dockdock.DockDock.savedState",
  ]

  caveats <<~EOS
    Shelfie (formerly DockDock) is signed with a Developer ID but is not
    Apple-notarized yet, so the cask removes the quarantine flag for it.
    macOS still may ask you to confirm the first launch in
    System Settings > Privacy & Security.
  EOS
end
