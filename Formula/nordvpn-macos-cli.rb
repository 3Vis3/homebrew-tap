class NordvpnMacosCli < Formula
  desc "Control NordVPN manual VPN profiles on macOS"
  homepage "https://github.com/3Vis3/nordvpn-macos-cli"
  url "https://github.com/3Vis3/nordvpn-macos-cli/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "5d0e258a08241d68d9aac0563dc429607045f7e0dfcab2a2209f6aaa48e63228"
  license "MIT"

  depends_on xcode: ["13.0", :build]
  depends_on "openvpn"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/nordvpn-macos"
  end

  test do
    assert_match "NordVPN macOS CLI", shell_output("#{bin}/nordvpn-macos help")
  end
end
