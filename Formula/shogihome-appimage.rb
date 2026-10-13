class ShogihomeAppimage < Formula
  desc "Shogi GUI for playing games and studying records"
  homepage "https://sunfish-shogi.github.io/shogihome/"
  url "https://github.com/sunfish-shogi/shogihome/releases/download/v1.29.1/release-v1.29.1-linux-appimage.zip"
  sha256 "fe8c7d18df85759c4c976150a8a8d28436989df2978a9e55b95b5d96291841b2"
  license "MIT"

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
    assert_match "Version:", shell_output("#{libexec}/ShogiHome.AppImage --appimage-version")
    assert_path_exists libexec/"ShogiHome/AppRun"
    assert_path_exists share/"applications/shogihome.desktop"
  end
end
