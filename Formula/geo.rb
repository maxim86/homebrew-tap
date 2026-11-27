class Geo < Formula
  desc "Spoof the GPS location of iPhones and Android phones connected to a Mac"
  homepage "https://github.com/maxim86/geo"
  url "https://github.com/maxim86/geo/releases/download/v0.1.1/geo-v0.1.1-macos-universal.tar.gz"
  sha256 "09782ef1eb874c54b74f1648b79fcd3705aab1d24404e690dcbbfa6dc48671ce"
  license "MIT"

  depends_on :macos

  def install
    bin.install "geo"
  end

  def caveats
    <<~EOS
      iOS 17+ needs Xcode 15 or newer. Android needs adb:
        brew install android-platform-tools
      Run `geo ui` for the map, `geo --help` for commands.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/geo --version")
  end
end
