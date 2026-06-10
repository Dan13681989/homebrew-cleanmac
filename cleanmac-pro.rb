class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.3.tar.gz"
  sha256 "7b90f238935e91b9c1f4bd80a8a7061a5a27b2e65ea86c3871737ee5c8e32154"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanmac"
    prefix.install Dir["src", "scripts", "cleanmac-dashboard", "uninstall.sh"]
  end

  test do
    system "#{bin}/cleanmac", "help"
  end
end
