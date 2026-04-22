cask "toktracker" do
  version "0.1.8"
  sha256 "ede8af4935c2818cebfc048388c7509553d7a754174a14aad41fc91b92e8e028"

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
