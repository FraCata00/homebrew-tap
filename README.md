# FraCata00's Homebrew tap

Casks for my macOS apps.

## GlassDeck

A menu bar system monitor in Liquid Glass, with real Touch Bar integration:
CPU, GPU, memory, disk, network, fan RPM, temperature, power and battery.

```sh
brew tap fracata00/tap
brew trust fracata00/tap          # Homebrew asks this of every third-party tap
brew install --cask glassdeck
xattr -dr com.apple.quarantine /Applications/GlassDeck.app
```

The last line is needed because the build is signed ad hoc rather than notarised.
(Homebrew 6 removed the `--no-quarantine` install flag, so the attribute is
cleared afterwards instead.)

Source and issues: [FraCata00/glassdeck](https://github.com/FraCata00/glassdeck).
