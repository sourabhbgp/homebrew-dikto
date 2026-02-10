# homebrew-dikto

Homebrew tap for [Dikto](https://github.com/diktoapp/dikto) — voice-to-text for macOS.

## Install

```bash
brew tap diktoapp/dikto
```

### GUI App (Cask)

```bash
brew install --cask dikto
```

### CLI Only (Formula)

Builds from source — requires Rust and cmake.

```bash
brew install diktoapp/dikto/dikto
```

## Gatekeeper

Dikto is not notarized. The cask automatically clears the quarantine flag, but if macOS still blocks the app, right-click it and choose **Open**, or run:

```bash
xattr -cr /Applications/Dikto.app
```
