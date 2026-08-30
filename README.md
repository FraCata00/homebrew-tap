# FraCata00's Homebrew tap

Casks for my macOS apps.

## GlassDeck

A menu bar system monitor in Liquid Glass, with real Touch Bar integration:
CPU, GPU, memory, disk, network, fan RPM, temperature, power and battery.

```sh
brew tap fracata00/tap
brew trust fracata00/tap          # Homebrew asks this of every third-party tap
brew install --cask --no-quarantine glassdeck
```

`--no-quarantine` is needed because the build is signed ad hoc rather than
notarised. Without it, clear the flag once after installing:

```sh
xattr -dr com.apple.quarantine /Applications/GlassDeck.app
```

Source and issues: [FraCata00/glassdeck](https://github.com/FraCata00/glassdeck).
