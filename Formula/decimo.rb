class Decimo < Formula
  desc "Arbitrary-precision calculator"
  homepage "https://github.com/forfudan/decimo"
  license "Apache-2.0"
  version "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/forfudan/decimo/releases/download/v0.10.0/decimo-0.10.0-darwin-arm64.tar.gz"
      sha256 "16fe7ca78c966800e5578596a135733bb7eb55b6b3c68c28fc118d97f6e7f4de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/forfudan/decimo/releases/download/v0.10.0/decimo-0.10.0-linux-x86_64.tar.gz"
      sha256 "0277d436985a36d647d86df750e5f3a95fca4164ee8a1af374b17a6fbf2987f1"
    end
  end

  def install
    # Install the binary and the bundled Mojo runtime libs side by side
    # under the formula's prefix. The binary's rpath is set to
    # @executable_path/../lib (macOS) / $ORIGIN/../lib (Linux), so
    # `bin/decimo` will find the dylibs in `lib/` automatically.
    bin.install "bin/decimo"
    lib.install Dir["lib/*"]
    pkgshare.install "README.md", "LICENSE", "NOTICE"
    # Bundle the third-party license texts so users can inspect them
    # via `brew info decimo` / the cellar.
    pkgshare.install "THIRD_PARTY_LICENSES" if Dir.exist?("THIRD_PARTY_LICENSES")
  end

  test do
    # Smoke test: the version flag should mention "decimo".
    assert_match "decimo", shell_output("#{bin}/decimo --version")
  end
end
