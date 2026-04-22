cask "toktracker" do
  version "0.2.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/akhil-gautam/toktracker/releases/download/mac-v#{version}/Tokscale-#{version}.zip",
      verified: "github.com/akhil-gautam/toktracker/"
  name "Tokscale"
  desc "Menubar app that tracks AI coding tool spend and surfaces proactive insights"
  homepage "https://github.com/akhil-gautam/toktracker"

  depends_on macos: ">= :sonoma"

  app "Tokscale.app"

  zap trash: [
    "~/Library/Application Support/Tokscale",
    "~/Library/Preferences/com.tokscale.menubar.plist",
    "~/Library/Caches/com.tokscale.menubar",
    "~/Library/LaunchAgents/com.tokscale.menubar.plist",
  ]
end
