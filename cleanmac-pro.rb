class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.5.tar.gz"
  sha256 "6f7151cff3857f83ebb8fd4e67963fd29c9f55285b87bc7cec6aa3064c5efbdc"
  license "MIT"

  depends_on :macos

  def install
    # Install main wrapper
    bin.install "cleanmac"
    # Install all scripts to libexec
    libexec.install Dir["src", "scripts", "cleanmac-analyze", "cleanmac-large-files",
                         "cleanmac-docker-clean", "cleanmac-security-scan",
                         "cleanmac-interactive", "cleanmac-clean-now",
                         "cleanmac-dashboard", "uninstall.sh"]
    # Replace @PREFIX@ with the actual libexec path
    inreplace bin/"cleanmac", "@PREFIX@", libexec
    # Make all scripts executable
    chmod "+x", Dir[libexec/"src/*", libexec/"scripts/*", libexec/"cleanmac-*", libexec/"uninstall.sh"]
  end

  test do
    system "#{bin}/cleanmac", "version"
  end
end
