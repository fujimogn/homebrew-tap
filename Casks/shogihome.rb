cask "shogihome" do
  version "1.30.0"
  sha256 "db92a1a0dae98252b5eaf336ffa9a2214d8eafaf28a948799026bbc1f176f9cc"

  url "https://github.com/sunfish-shogi/shogihome/releases/download/v#{version}/release-v#{version}-mac.zip"
  name "ShogiHome"
  desc "Shogi GUI for playing games and studying records"
  homepage "https://sunfish-shogi.github.io/shogihome/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey
  container nested: "ShogiHome-#{version}-universal.dmg"

  app "ShogiHome.app"

  postflight_steps do
    # The upstream app is ad-hoc signed and is not notarized.
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ShogiHome.app"]
  end

  zap trash: [
    "~/Library/Application Support/ShogiHome",
    "~/Library/Preferences/com.electron.electron-shogi.plist",
    "~/Library/Saved Application State/com.electron.electron-shogi.savedState",
  ]
end
