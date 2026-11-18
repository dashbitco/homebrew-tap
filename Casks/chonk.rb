cask "chonk" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.3"
  sha256 arm:   "b9a9d188fed14d9ffa558e3f02880a76d7a911ec59192a312ad21bf4a8318674",
         intel: "b27cf40378e25ae5d64cdd8b473238b7834bb90a95591ab6e29a6b5aea32dc0d"

  url "https://github.com/dashbitco/chonk-releases/releases/download/v#{version}/Chonk-darwin-#{arch}.dmg",
      verified: "github.com/dashbitco/chonk-releases/"
  name "Chonk"
  desc "Locally synced, keyboard-first app for GitHub pull requests"
  homepage "https://chonk.gg/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Chonk.app"
  binary "#{appdir}/Chonk.app/Contents/MacOS/chonk-cli", target: "chonk"

  zap trash: [
    "~/Library/Application Support/Chonk",
    "~/Library/Caches/gg.chonk.Chonk",
    "~/Library/Logs/Chonk",
    "~/Library/Preferences/gg.chonk.Chonk.plist",
    "~/Library/WebKit/gg.chonk.Chonk",
  ]
end
