cask "chonk" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.9"
  sha256 arm:   "a088822665aebc1b49a3c62e89d202855af130dd99259af5681824c4bec35cf2",
         intel: "dfcabff8828c952399e065fa891a90256f443ffdbb5d77be29e62b714bec6625"

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
