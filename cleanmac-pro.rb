class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.7.tar.gz"
  sha256 "d3244061baaaf1ca31f161ae8644277eceed2646c0da1c1af5c40a5159f77ed0"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanmac"
    prefix.install Dir["cleanmac-*", "src", "scripts", "uninstall.sh"]
    chmod "+x", Dir[prefix/"cleanmac-*", prefix/"src/*", prefix/"scripts/*", prefix/"uninstall.sh"]
  end

  test do
    system "#{bin}/cleanmac", "version"
  end
end
