cask "shogihome" do
  version "1.29.1"
  sha256 "9e7f66632d6ef932248def6616969aa146a3f8d411f1057ff25fa76716ff3cbd"

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
