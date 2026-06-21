class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.29.tar.gz"
  sha256 "c77f2db4f21c8d83470017dc38e906e2aaa3ef4757380dac5a0b8009b2622597"
  license "MIT"

  depends_on :macos

  def install
    bin.install "cleanmac"
    prefix.install Dir["cleanmac-*", "src", "scripts", "uninstall.sh"]
    if File.exist?("cleanmac-completion.bash")
      bash_completion.install "cleanmac-completion.bash" => "cleanmac"
    end
    if File.exist?("cleanmac-completion.zsh")
      zsh_completion.install "cleanmac-completion.zsh" => "_cleanmac"
    end
    chmod "+x", Dir[prefix/"cleanmac-*", prefix/"src/*", prefix/"scripts/*", prefix/"uninstall.sh"]
  end

  test do
    system "#{bin}/cleanmac", "version"
  end
end
