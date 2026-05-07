class NordvpnMacosCli < Formula
  desc "Control NordVPN manual VPN profiles on macOS"
  homepage "https://github.com/3Vis3/nordvpn-macos-cli"
  url "https://github.com/3Vis3/nordvpn-macos-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "deaa17a3d1801bd7655b54aad77dd26484d9b43604aeddd57bf085a88e241aaf"
  license "MIT"

  depends_on xcode: ["13.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/nordvpn-macos"
  end

  test do
    assert_match "NordVPN macOS CLI", shell_output("#{bin}/nordvpn-macos help")
  end
end
