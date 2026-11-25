cask "chonk" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.11"
  sha256 arm:   "586ad21f98860468e1179fc93f73e06574e0e7d3e37a99dcde8766ad74c1bd55",
         intel: "572205812fe1c497e769c17e259d59fe1f6326777297b75ffe42c272ad1c472e"

  url "https://github.com/dashbitco/chonk-releases/releases/download/v#{version}/Chonk-darwin-#{arch}.dmg"
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
