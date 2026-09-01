cask "glassdeck" do
  version "1.8.0"
  sha256 "af4db1e9b35e63e6d34b72ba32dca93c9dff2db72733e048b89bafdca6bef23c"

  url "https://github.com/FraCata00/glassdeck/releases/download/v#{version}/GlassDeck.zip",
      verified: "github.com/FraCata00/glassdeck/"
  name "GlassDeck"
  desc "Menu bar system monitor in Liquid Glass with Touch Bar integration"
  homepage "https://github.com/FraCata00/glassdeck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "GlassDeck.app"

  # GlassDeck is signed ad hoc rather than notarised, which needs a paid Apple
  # Developer account. Homebrew 6 removed the `--no-quarantine` install flag, so
  # the attribute is cleared here instead — the same step the release notes ask
  # people to run by hand. It is disclosed in the caveats below.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GlassDeck.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/dev.fracata00.glassdeck",
    "~/Library/Preferences/dev.fracata00.glassdeck.plist",
  ]

  caveats do
    <<~EOS
      GlassDeck is signed ad hoc rather than notarised, so this cask cleared the
      quarantine attribute on it during installation.

      GlassDeck has no Dock icon: look for the live meters in the menu bar.
    EOS
  end
end
