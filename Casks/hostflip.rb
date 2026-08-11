cask "hostflip" do
  version "0.1.2"
  sha256 "847354f216dbfff5844edcf965a20d24692463ac125fd1ab3cdc2d81edf82c91"

  url "https://github.com/heronapp/hostflip/releases/download/v#{version}/Hostflip-#{version}.dmg"
  name "hostflip"
  desc "Native menu bar hosts switcher with zero-interruption switching"
  homepage "https://github.com/heronapp/hostflip"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Hostflip.app"

  uninstall quit: "com.heronapp.hostflip"

  zap trash: [
    "~/Library/Application Support/hostflip",
    "~/Library/Caches/com.heronapp.hostflip",
    "~/Library/HTTPStorages/com.heronapp.hostflip",
    "~/Library/Preferences/com.heronapp.hostflip.plist",
    "~/Library/Saved Application State/com.heronapp.hostflip.savedState",
  ]

  caveats <<~EOS
    If you approved the privileged helper, run "Deactivate and Remove Helper…"
    inside the app before uninstalling to unregister it from Login Items.
  EOS
end
