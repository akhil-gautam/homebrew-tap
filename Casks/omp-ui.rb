cask "omp-ui" do
  version "0.1.0"
  sha256 "5690a892d958b52f52cd2cf8c5ff22b5958ddcf336454865df67dafea5dacbfc"

  url "https://github.com/akhil-gautam/omp-ui/releases/download/v#{version}/omp-ui_#{version}_aarch64.dmg"
  name "omp-ui"
  desc "Desktop app for omp: many projects open at once, each with its own agent"
  homepage "https://github.com/akhil-gautam/omp-ui"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      next unless tag&.start_with?("v")
      tag.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  caveats <<~EOS
    omp-ui is ad-hoc signed and is not Apple-notarized. On first launch, try
    opening omp-ui, then go to System Settings > Privacy & Security, scroll to
    Security, and click Open Anyway. Authenticate and confirm Open once.

    omp-ui drives the omp coding agent, which has to be installed separately
    and on your PATH.
  EOS

  app "omp-ui.app"

  zap trash: [
    "~/Library/Application Support/sh.omp.ui",
    "~/Library/Preferences/sh.omp.ui.plist",
    "~/Library/Saved Application State/sh.omp.ui.savedState",
    "~/Library/WebKit/omp-ui",
    "~/Library/WebKit/sh.omp.ui",
  ]
end
