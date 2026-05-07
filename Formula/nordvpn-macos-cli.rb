class NordvpnMacosCli < Formula
  desc "Control NordVPN manual VPN profiles on macOS"
  homepage "https://github.com/3Vis3/nordvpn-macos-cli"
  url "https://github.com/3Vis3/nordvpn-macos-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0afc5a705e52ecc3ef840629817656a570f4806492963655cd5e1b6ff8340303"
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
