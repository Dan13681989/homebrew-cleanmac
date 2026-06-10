class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.4.tar.gz"
  sha256 "b57ae12eff34f049fb2689abef24aa0c3aa1a56f0e02b9ab591fe43a774e3458"
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
