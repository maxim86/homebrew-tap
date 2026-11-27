class Geo < Formula
  desc "Spoof the GPS location of iPhones and Android phones connected to a Mac"
  homepage "https://github.com/maxim86/geo"
  url "https://github.com/maxim86/geo/releases/download/v0.1.0/geo-v0.1.0-macos-universal.tar.gz"
  sha256 "a3f8e7e7fb6f9159da1ab4e629240b5d5bb11e16a119049a6fae00bbc9227716"
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
