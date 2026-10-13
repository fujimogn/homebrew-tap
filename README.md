# Homebrew Tap

This is Fujii's unofficial personal Homebrew tap. It packages [ShogiHome](https://github.com/sunfish-shogi/shogihome) for macOS and Linux; it is not an official ShogiHome distribution.

ShogiHome is created and maintained by **sunfish-shogi**. Please support the author and consult the [official repository](https://github.com/sunfish-shogi/shogihome) and [official website](https://sunfish-shogi.github.io/shogihome/) for the project itself.

This tap checks the official latest release weekly and commits package updates automatically. Prereleases are not included.
GitHub disables scheduled workflows in public repositories after 60 days without repository activity. Check the last run under **Actions → Update ShogiHome**; if GitHub notifies you that the schedule was disabled, [re-enable the workflow](https://docs.github.com/en/actions/how-tos/manage-workflow-runs/disable-and-enable-workflows).

## Install

macOS (12 or newer):

```sh
brew tap fujimogn/tap
brew install --cask fujimogn/tap/shogihome
```

Linux (x86-64):

```sh
brew tap fujimogn/tap
brew install fujimogn/tap/shogihome-appimage
```

The Linux formula installs an AppImage, a `shogihome` command, and a desktop entry. It requires a graphical desktop and an AppImage-compatible runtime.

## Support

For problems with these Homebrew packages, [open an issue in this tap](https://github.com/fujimogn/homebrew-tap/issues), **not in the official ShogiHome repository**. For ShogiHome application issues, see the upstream project's guidance.
