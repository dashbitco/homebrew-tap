cask "chonk" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.5"
  sha256 arm:   "c23eacbfd4dc4e6265d3b418dae10984782f9b88888bec5fcadba1d8679af957",
         intel: "786bd9a143cd0351538d0f5d2f742fdec1cf936828673d3ecc9603e9e0f87295"

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
