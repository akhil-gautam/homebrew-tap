cask "toktracker" do
  version "0.1.10"
  sha256 "0231e9a43491fb9eed5cfa9503cb980692c22dfd8f16ad7a9b99c638e7251264"

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
