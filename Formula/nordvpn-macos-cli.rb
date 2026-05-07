class NordvpnMacosCli < Formula
  desc "Control NordVPN manual VPN profiles on macOS"
  homepage "https://github.com/3Vis3/nordvpn-macos-cli"
  url "https://github.com/3Vis3/nordvpn-macos-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "dd29f0d128b15c75395b7d2463f37e2fd86fed0317cbb4179330d440f45e2a5d"
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
