cask "omp-ui" do
  version "0.1.0"
  sha256 "a72f6f405cc86d4c27b0f395fe5f63145eed505c769d89b5b3f7865dc7726656"

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
    omp-ui is ad-hoc signed and is not Apple-notarized, so the cask removes
    the quarantine flag for it. macOS still may ask you to confirm the first
    launch in System Settings > Privacy & Security.

    omp-ui drives the omp coding agent, which has to be installed separately
    and on your PATH.
  EOS

  app "omp-ui.app"

  # The app is ad-hoc signed, so Gatekeeper would otherwise refuse to open
  # it. Homebrew's download is what puts the quarantine flag on it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/omp-ui.app"]
  end

  zap trash: [
    "~/Library/Application Support/sh.omp.ui",
    "~/Library/Preferences/sh.omp.ui.plist",
    "~/Library/Saved Application State/sh.omp.ui.savedState",
    "~/Library/WebKit/omp-ui",
    "~/Library/WebKit/sh.omp.ui",
  ]
end
