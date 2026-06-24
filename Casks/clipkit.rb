cask "clipkit" do
  version "2.0.0"
  sha256 "26cd879be006f7c5a92819e1e331ca48ffaade99f6027bba2861fe6dbe72107a"

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
