class Dikto < Formula
  desc "Voice-to-text CLI for macOS — local speech transcription"
  homepage "https://diktoapp.github.io"
  url "https://github.com/diktoapp/dikto/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "7ba9eb33b8125f40ebbe1023d36365b3acc4b7df7210b2db08ead8bcf9d27f7f"
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
