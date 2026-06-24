cask "clipkit" do
  version "1.0.6"
  sha256 "7bae65ca4768f7d8eab6e88bbbbd6171696db56fd8f47e479cb63ac4b9e6d0f4"

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
