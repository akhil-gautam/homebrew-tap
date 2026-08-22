cask "justsearch" do
  version "0.4.0"
  sha256 "dd64a8e18049a1e444f9cb1d20e94cccc75779711eb90cdc5de6a494e9e02adf"

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
