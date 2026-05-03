cask "bloatmac" do
  version "0.2.4"
  sha256 "39063b76bcb904efacd451db4c2e63c03231d301dabd2c84ab7ebaa2b1d87b4b"

  url "https://github.com/akhil-gautam/bloat/releases/download/bloatmac-v#{version}/BloatMac-v#{version}-macos.dmg"
  name "BloatMac"
  desc "Native macOS companion app for the bloat disk-analyzer CLI"
  homepage "https://github.com/akhil-gautam/bloat"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      next unless tag&.start_with?("bloatmac-v")
      tag.sub("bloatmac-v", "")
    end
  end

  depends_on macos: ">= :tahoe"

  app "BloatMac.app"

  zap trash: [
    "~/Library/Application Support/BloatMac",
    "~/Library/Preferences/akhilgautam123.bloatmac.plist",
    "~/Library/Saved Application State/akhilgautam123.bloatmac.savedState",
  ]
end
