cask "capturemann" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6"
  sha256 arm:   "12d6973ca7d45be54e0a8ddc468c4dd21e43c0b3123134e7a779af0560246469",
         intel: "580f5a8904eb85b10f3550848d35af86257a07fc2b635000d0a4b966bd4e8ec7"

  url "https://github.com/craft-mann/capturemann/releases/download/v#{version}/CaptureMann-v#{version}-macos-#{arch}.dmg"
  name "CaptureMann"
  desc "Screenshots and screen recording with local AI captions, MCP tools and a CLI"
  homepage "https://www.craftmann.app/capturemann/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "CaptureMann.app"
  # The command line: `capturemann` (`capturemann mcp` starts the MCP server).
  binary "#{appdir}/CaptureMann.app/Contents/MacOS/capturemann"

  # Settings and downloaded speech models only. The capture library (default ~/Movies/CaptureMann)
  # holds your recordings and is never removed.
  zap trash: [
    "~/Library/Application Support/CaptureMann",
    "~/Library/Caches/dev.capturemann.app",
    "~/Library/LaunchAgents/dev.capturemann.app.plist",
    "~/Library/Saved Application State/dev.capturemann.app.savedState",
  ]
end
