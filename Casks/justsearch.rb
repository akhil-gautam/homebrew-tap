cask "justsearch" do
  version "0.3.0"
  sha256 "df16d16ccfbb577b8202e4e9b76d7e3e740c00d3af47d5250fe940ab09b8865a"

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
