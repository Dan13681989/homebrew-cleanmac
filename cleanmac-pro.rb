class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.6.tar.gz"
  sha256 "3a3b7737a923912f9a15bcdc85c4104637b8337db70d0a017fce6d0f74aa3f81"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanmac"
    # Install all scripts (both from root and from src/scripts)
    prefix.install Dir["cleanmac-*", "src", "scripts", "uninstall.sh"]
    # Ensure everything is executable
    chmod "+x", Dir[prefix/"cleanmac-*", prefix/"src/*", prefix/"scripts/*", prefix/"uninstall.sh"]
  end

  test do
    system "#{bin}/cleanmac", "version"
  end
end
