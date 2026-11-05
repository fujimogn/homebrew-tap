class ShogihomeAppimage < Formula
  desc "Shogi GUI for playing games and studying records"
  homepage "https://sunfish-shogi.github.io/shogihome/"
  url "https://github.com/sunfish-shogi/shogihome/releases/download/v1.30.0/release-v1.30.0-linux-appimage.zip"
  sha256 "e48ddc8305d58b1bd1e352caaed71328d4d20ce180a414d9d032ffe206f72186"
  license "MIT"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :x86_64
  depends_on :linux

  def install
    appimage = "ShogiHome-#{version}.AppImage"
    system "./#{appimage}", "--appimage-extract"
    (share/"icons/hicolor/512x512/apps").install "squashfs-root/usr/share/icons/hicolor/512x512/apps/shogihome.png"

    libexec.install appimage => "ShogiHome.AppImage"
    libexec.install "squashfs-root" => "ShogiHome"
    (bin/"shogihome").write <<~SH
      #!/bin/sh
      exec "#{opt_libexec}/ShogiHome/AppRun" "$@"
    SH

    (share/"applications/shogihome.desktop").write <<~DESKTOP
      [Desktop Entry]
      Name=ShogiHome
      Comment=Play shogi and study game records
      Exec=#{opt_bin}/shogihome %U
      Icon=shogihome
      Type=Application
      Terminal=false
      Categories=Game;BoardGame;
    DESKTOP
  end

  test do
    system libexec/"ShogiHome.AppImage", "--appimage-version"
    assert_path_exists libexec/"ShogiHome/AppRun"
    assert_path_exists share/"applications/shogihome.desktop"
  end
end
