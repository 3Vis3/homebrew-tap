class NordvpnMacosCli < Formula
  desc "Control NordVPN manual VPN profiles on macOS"
  homepage "https://github.com/3Vis3/nordvpn-macos-cli"
  url "https://github.com/3Vis3/nordvpn-macos-cli/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "35097c3d4af43ba856543ece321f89973214e5c2eb79afcd796a03a66f967f13"
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
