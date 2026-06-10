class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.8.tar.gz"
  sha256 "7695fe47ca5934f90c28a84a19ddfd14e9518102193ace5ccf591b7c8a5cabc7"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanmac"
    prefix.install Dir["cleanmac-*", "src", "scripts", "uninstall.sh"]
    # Install shell completions
    bash_completion.install "cleanmac-completion.bash" => "cleanmac"
    zsh_completion.install "cleanmac-completion.zsh" => "_cleanmac"
    chmod "+x", Dir[prefix/"cleanmac-*", prefix/"src/*", prefix/"scripts/*", prefix/"uninstall.sh"]
  end

  test do
    system "#{bin}/cleanmac", "version"
  end
end
