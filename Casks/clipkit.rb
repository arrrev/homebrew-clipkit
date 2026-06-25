cask "clipkit" do
  version "2.0.6"
  sha256 "e120b858e7d944b24d77810fbbdc92fe7974db85632fa7eefb62517e2469828a"

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
