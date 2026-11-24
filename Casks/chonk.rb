cask "chonk" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.10"
  sha256 arm:   "7585b279d7d61450e82d96380a70fa434a85194204c33e0aca70885383df9e17",
         intel: "e00b0fc94bb2957bf0318683057aa150349de35100db25dad37553439d51834c"

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
