cask "bloatmac" do
  version "1.0.2"
  sha256 "01607e457401d88d6d76ab1997ad9de629c817282c37bfa862f978f19f4f1068"

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
