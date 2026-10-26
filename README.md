# Homebrew tap for CaptureMann

```sh
brew install --cask craft-mann/tap/capturemann
```

Installs the notarized CaptureMann app (Apple Silicon, macOS 13 or later) from the
[GitHub release](https://github.com/craft-mann/capturemann/releases) and links the `capturemann`
command line into Homebrew's `bin`. Update with `brew upgrade --cask capturemann`.

`brew uninstall --cask --zap capturemann` also removes the settings and downloaded speech models.
Your capture library (default `~/Movies/CaptureMann`) is never removed.

The cask is in `Casks/capturemann.rb`. When a new version is released, change `version` and
`sha256` (the release's `.sha256` file has the value).
