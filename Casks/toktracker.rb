cask "toktracker" do
  version "0.1.7"
  sha256 "3d4d2e2a2461a7f4d2ea37b64f2ae8fedfc56a32da2103341c7e5b660f85eac2"

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
