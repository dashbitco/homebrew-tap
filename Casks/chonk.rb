cask "chonk" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.4"
  sha256 arm:   "1dfc453e4cfa3419e8e89ec1cffd4955cde518cd6ef79724e02ba18472643526",
         intel: "0ae44ccd825b751e4860ad09d1b6a467f5ad87f4bc2a982304ba414fab81dbff"

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
