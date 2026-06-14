class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.23.tar.gz"
  sha256 "146633d59e119a439610cfe60db682c2d9d854ed469804027b6fd2d8f6825d4b"
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
