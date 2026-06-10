class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.2.tar.gz"
  sha256 "e5f3c6be5be2e1898acdd1bd9f658f3fde4da18070ddc2d9e0a8045aec8e4a58"
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
