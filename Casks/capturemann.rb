cask "capturemann" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.9"
  sha256 arm:   "fd5aed2d16dbcc09dd1ff4220453573a64af0a449948b3feb9e55ceace9b1e09",
         intel: "dc3e44fb1cf605567d7259b18d5f8537cadf8c6d5e2254666e8ac155a2978d97"

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
