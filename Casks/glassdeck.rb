cask "glassdeck" do
  version "1.5.0"
  sha256 "66434f583a0cf3aa95ab51c5873f5eb49f217110a8080e22c48e8af8ab5b1c9b"

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
