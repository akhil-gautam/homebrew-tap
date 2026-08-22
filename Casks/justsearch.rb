cask "justsearch" do
  version "0.2.1"
  sha256 "7a8b6e5495d0047239100e36f15347ad18b6291bb127e805d4198a8287c3caa2"

  url "https://github.com/akhil-gautam/justsearch/releases/download/v#{version}/JustSearch-v#{version}.zip"
  name "JustSearch"
  desc "Launcher and command palette for macOS"
  homepage "https://github.com/akhil-gautam/justsearch"

  livecheck do
    url :url
    strategy :github_latest do |json|
      json["tag_name"]&.sub(/\Av/, "")
    end
  end

  depends_on macos: ">= :sonoma"

  app "JustSearch.app"

  zap trash: [
    "~/Library/Application Support/JustSearch",
    "~/Library/Preferences/com.justsearch.app.plist",
  ]
end
