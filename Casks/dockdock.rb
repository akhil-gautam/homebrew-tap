cask "dockdock" do
  version "0.1.0"
  sha256 "e3a22b5fc1302c571f6f8d67db0390a664bc0ad6baeeaba2c2976aa5beb76146"

  url "https://github.com/akhil-gautam/dockdock/releases/download/v#{version}/DockDock-#{version}.zip"
  name "DockDock"
  desc "Widget bar that takes the Dock's place"
  homepage "https://github.com/akhil-gautam/dockdock"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      next unless tag&.start_with?("v")

      tag.delete_prefix("v")
    end
  end

  depends_on macos: :tahoe

  app "DockDock.app"

  # Not notarized, so Gatekeeper would otherwise refuse to open it. Homebrew's
  # download is what puts the quarantine flag on it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DockDock.app"]
  end

  # Quitting lets DockDock restore the macOS Dock's own auto-hide setting.
  uninstall quit: "app.dockdock.DockDock"

  zap trash: [
    "~/Library/Application Support/DockDock",
    "~/Library/Preferences/app.dockdock.DockDock.plist",
    "~/Library/Saved Application State/app.dockdock.DockDock.savedState",
  ]

  caveats <<~EOS
    DockDock is signed with a Developer ID but is not Apple-notarized yet, so
    the cask removes the quarantine flag for it. macOS still may ask you to
    confirm the first launch in System Settings > Privacy & Security.
  EOS
end
