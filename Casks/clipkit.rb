cask "clipkit" do
  version "2.0.7"
  sha256 "a9b260e6e3526f354718609541ce8452ecf99bee4cf506ed501fdcb0f21f061d"

  url "https://github.com/arrrev/clipkit/releases/download/v#{version}/ClipKit-#{version}.zip"
  name "ClipKit"
  desc "macOS clipboard manager with history, text transforms, and global hotkeys"
  homepage "https://github.com/arrrev/clipkit"

  app "ClipKit.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-rd", "com.apple.quarantine", "#{appdir}/ClipKit.app"],
      sudo: false
  end

  zap trash: [
    "~/.clipkit",
    "~/Library/LaunchAgents/com.clipkit.agent.plist",
  ]
end
