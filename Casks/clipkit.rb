cask "clipkit" do
  version "2.1.4"
  sha256 "24697ba9916d9ccdb677828707169b4eabf38f0758751d03f0636e1133bee4e1"

  url "https://github.com/arrrev/clipkit/releases/download/v#{version}/ClipKit-#{version}.zip"
  name "ClipKit"
  desc "Clipboard manager with history, text transforms, and global hotkeys"
  homepage "https://github.com/arrrev/clipkit"

  depends_on arch: :arm64
  depends_on :macos

  app "ClipKit.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-rd", "com.apple.quarantine", "{{appdir}}/ClipKit.app"],
        must_succeed: false
  end

  zap trash: [
    "~/.clipkit",
    "~/Library/LaunchAgents/com.clipkit.agent.plist",
  ]
end
