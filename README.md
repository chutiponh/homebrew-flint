# homebrew-flint

Homebrew tap for [**Flint**](https://github.com/chutiponh/flint) — a native macOS menubar toolkit for developers.

## Install

```bash
brew tap chutiponh/flint
brew install --cask flint
```

Then launch Flint from Applications or Spotlight.

> This is a self-hosted tap because the current build is not yet notarized by Apple
> (see the [funding goal](https://github.com/sponsors/chutiponh)). The cask strips the
> quarantine flag on install so the app opens normally. Once Flint is notarized it will
> move to the official `homebrew/cask` repo.

## Uninstall

```bash
brew uninstall --cask flint
brew untap chutiponh/flint
```
