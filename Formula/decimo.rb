class Decimo < Formula
  desc "Arbitrary-precision calculator"
  homepage "https://github.com/forfudan/decimo"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/forfudan/decimo/releases/download/cli-v0.10.0-alpha.1/decimo-0.10.0-alpha.1-darwin-arm64.tar.gz"
      sha256 "1139072b23cbbd29445f4005663e6fddf9d1ae13a075f9883da6aae96c80fbf9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/forfudan/decimo/releases/download/cli-v0.10.0-alpha.1/decimo-0.10.0-alpha.1-linux-x86_64.tar.gz"
      sha256 "2c52538f88aedfb5aaee31e2d87c05a443a9457e6fe9b539539bd1821c41929c"
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
  end

  test do
    # Smoke test: the version flag should mention "decimo".
    assert_match "decimo", shell_output("#{bin}/decimo --version")
  end
end
