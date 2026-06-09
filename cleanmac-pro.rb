class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.2.tar.gz"
  sha256 "REPLACE_WITH_NEW_SHA256"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanmac"
    prefix.install Dir["src", "cleanmac-dashboard", "uninstall.sh"]
    # Ensure the wrapper can find helpers
    inreplace bin/"cleanmac", /^PREFIX=.*/, "PREFIX=\"#{prefix}\""
  end

  test do
    system "#{bin}/cleanmac", "help"
  end
end
