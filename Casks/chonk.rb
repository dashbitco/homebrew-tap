cask "chonk" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.7"
  sha256 arm:   "8a3c9d006ff46a0fbfcdbfa43cad69322fcb5097615439b87342ed869dcb042b",
         intel: "0f9168c4b77d9682535a14d24bfe40a135e67f9b958553e91bc573ba7f30bfca"

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
