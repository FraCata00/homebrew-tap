cask "glassdeck" do
  version "1.2.0"
  sha256 "157ac3aaf58ded028aced2ed59ecd8d539ee520e478e8445bee10e13514bee19"

  url "https://github.com/FraCata00/glassdeck/releases/download/v#{version}/GlassDeck.zip",
      verified: "github.com/FraCata00/glassdeck/"
  name "GlassDeck"
  desc "Menu bar system monitor in Liquid Glass with Touch Bar integration"
  homepage "https://github.com/FraCata00/glassdeck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "GlassDeck.app"

  # The build is signed ad hoc rather than notarised, so install with
  # `--no-quarantine` or clear the flag once after installing.
  caveats do
    <<~EOS
      GlassDeck is signed ad hoc, not notarised. If macOS refuses to open it:

        xattr -dr com.apple.quarantine "#{appdir}/GlassDeck.app"

      GlassDeck has no Dock icon: look for the live meters in the menu bar.
    EOS
  end

  zap trash: [
    "~/Library/Preferences/dev.fracata00.glassdeck.plist",
    "~/Library/Caches/dev.fracata00.glassdeck",
  ]
end
