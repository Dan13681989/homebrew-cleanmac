class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "cd9fcee4eea24c9f65ef9019ed5dfe80b8963a4c1ab4e1ac7f519735cfbab727"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanmac"
    prefix.install Dir["src", "cleanmac-dashboard", "uninstall.sh"]
    bin.install_symlink prefix/"cleanmac-dashboard" => "cleanmac-dashboard"
  end

  test do
    system "#{bin}/cleanmac", "help"
  end
end
