cask "capturemann" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.3"
  sha256 arm:   "09747c0cc9d9bd04215c88bf03501898b944c773777df0bf65edc5472d4b1ba8",
         intel: "6f493e15197ce1ab1d320c3018798ecd7d2c7cf5da53a5d0a626e54108da7d28"

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
