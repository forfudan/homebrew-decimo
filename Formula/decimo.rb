class Decimo < Formula
  desc "Arbitrary-precision calculator"
  homepage "https://github.com/forfudan/decimo"
  license "Apache-2.0"
  version "0.14.0"

  # The URLs interpolate `version`, so a release bump is the version above
  # and the three checksums below. Each tarball's SHA-256 is published beside
  # it on the release as `<name>.tar.gz.sha256`.
  on_macos do
    on_arm do
      url "https://github.com/forfudan/decimo/releases/download/v#{version}/decimo-#{version}-darwin-arm64.tar.gz"
      sha256 "e8d033284ef6b02bd52c511d341741a929cd2927a599182d3e550b6aaec2c259"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/forfudan/decimo/releases/download/v#{version}/decimo-#{version}-linux-x86_64.tar.gz"
      sha256 "85534ee156cefffd4d3a9a2a6fdc9bbc47dbd4c83881637b7c299dc33fb784d7"
    end
    on_arm do
      url "https://github.com/forfudan/decimo/releases/download/v#{version}/decimo-#{version}-linux-aarch64.tar.gz"
      sha256 "42e4f57751d5698d790d4a8ff4bbe4e505544400f496e585018ca412fb60d94a"
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
