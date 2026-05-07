class NordvpnMacosCli < Formula
  desc "Control NordVPN manual VPN profiles on macOS"
  homepage "https://github.com/3Vis3/nordvpn-macos-cli"
  url "https://github.com/3Vis3/nordvpn-macos-cli/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "112d93203cbdd7277a996a6a876e5ab5ffdb3dc6366ce2e93169743e9ffc6874"
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
