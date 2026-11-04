cask "capturemann" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.7"
  sha256 arm:   "9a8e506386899459af21523606888c1268f6d41937a335d06df4215650249410",
         intel: "e3fac6ef0e46409da8e1674d9bb68f2013d28ce645b8baaa0751a7fd4fbc59f9"

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
