cask "dikto" do
  version "1.2.0"
  sha256 "0d6c69b83fe7de9b3bd94e6a2c3b0924b041870c71e7b8a4891b8ce980b8c116"

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
