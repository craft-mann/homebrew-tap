cask "capturemann" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2"
  sha256 arm:   "e289c29c0c3d75d65d907174e3e53cbe55b7a2c524980a254722400a885b90c2",
         intel: "afd4aed0bdae26aac4dc47b0dacaaa013b36e3d78a44ac86f27c5bef7b120118"

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
