cask "dikto" do
  version "1.1.0"
  sha256 "b66122b7ddba50c43b53907df448590cc9bbfd19bffc5037eb986c5b7d08bc65"

  url "https://github.com/diktoapp/dikto/releases/download/v#{version}/Dikto-#{version}.dmg"
  name "Dikto"
  desc "Voice-to-text transcription for macOS"
  homepage "https://diktoapp.github.io"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64
  app "Dikto.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Dikto.app"], sudo: false
  end

  zap trash: ["~/.config/dikto", "~/.local/share/dikto"]

  caveats <<~EOS
    Dikto requires Microphone access and Accessibility permission for auto-paste.
    Grant both in System Settings > Privacy & Security on first launch.
  EOS
end
