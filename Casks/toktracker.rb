cask "toktracker" do
  version "0.1.11"
  sha256 "ca539ca37b00b7a4a75f0b885e15534080eeb00f6ac1f41b8f65da1d7b3ab09b"

  url "https://github.com/akhil-gautam/toktracker/releases/download/mac-v#{version}/Toktracker-#{version}.zip",
      verified: "github.com/akhil-gautam/toktracker/"
  name "Toktracker"
  desc "Menubar app that tracks AI coding tool spend and surfaces proactive insights"
  homepage "https://github.com/akhil-gautam/toktracker"

  depends_on macos: ">= :sonoma"

  app "Toktracker.app"

  zap trash: [
    "~/Library/Application Support/Tokscale",
    "~/Library/Preferences/com.tokscale.menubar.plist",
    "~/Library/Caches/com.tokscale.menubar",
    "~/Library/LaunchAgents/com.tokscale.menubar.plist",
  ]
end
