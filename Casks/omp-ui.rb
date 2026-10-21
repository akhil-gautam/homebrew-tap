cask "omp-ui" do
  version "0.6.0"
  sha256 "0ffa8f080e8e41434ab64d97f0c08b2fa0097ef7ac869e15c80da4ae3205374b"

  url "https://github.com/akhil-gautam/omp-ui/releases/download/v#{version}/omp-ui-#{version}.tar.gz"
  name "omp-ui"
  desc "A native macOS app for the omp coding agent"
  homepage "https://github.com/akhil-gautam/omp-ui"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      next unless tag&.start_with?("v")
      tag.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

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
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/omp-ui.app"]
  end

  zap trash: [
    "~/Library/Application Support/omp-ui",
    "~/Library/Application Support/sh.omp.ui",
    "~/Library/Preferences/sh.omp.ui.plist",
    "~/Library/Saved Application State/sh.omp.ui.savedState",
  ]
end
