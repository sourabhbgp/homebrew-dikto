class Dikto < Formula
  desc "Voice-to-text CLI for macOS — local speech transcription"
  homepage "https://diktoapp.github.io"
  url "https://github.com/diktoapp/dikto/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "f7c36de88dd2fae5a82117ba14e62bcba334deaa04202e4a16d14c6986497a48"
  license "MIT"
  head "https://github.com/diktoapp/dikto.git", branch: "main"

  depends_on "rust" => :build
  depends_on "cmake" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/dikto-cli")
  end

  test do
    assert_match "dikto", shell_output("#{bin}/dikto --version")
  end
end
