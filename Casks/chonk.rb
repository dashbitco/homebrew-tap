cask "chonk" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.2"
  sha256 arm:   "b608726f899f060d569d600a6e74e8150cedadaf1969846c252cc8c83cf18957",
         intel: "4f827f9741550f802842d9b00f0ad0fa11a3b4aec6e1607f98d292cce0457059"

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
