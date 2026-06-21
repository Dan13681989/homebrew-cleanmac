class CleanmacPro < Formula
  desc "Professional macOS optimization suite with TUI and security scanning"
  homepage "https://github.com/Dan13681989/CleanMac-Pro"
  url "https://github.com/Dan13681989/CleanMac-Pro/archive/refs/tags/v3.0.26.tar.gz"
  sha256 "6f447c39acf6ec2a7b7ed914924b5a66b4772c47a802050eb2da98bcaf4f444d"
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
