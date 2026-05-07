class NordvpnMacosCli < Formula
  desc "Control NordVPN manual VPN profiles on macOS"
  homepage "https://github.com/3Vis3/nordvpn-macos-cli"
  url "https://github.com/3Vis3/nordvpn-macos-cli/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "90d18d40d87e1a9939e88790d462e3589e0fbbb6231599b9acc1e78f5d03b198"
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
