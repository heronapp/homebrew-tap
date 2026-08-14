cask "hostflip" do
  version "0.1.8"
  sha256 "c3cee959f3c0d6801ff13c5d3e9f0b7c235240dbef19ea26f49765e213e0feb6"

  auto_updates true

  url "https://github.com/heronapp/hostflip/releases/download/v#{version}/Hostflip-#{version}.dmg"
  name "hostflip"
  desc "Native menu bar hosts switcher with zero-interruption switching"
  homepage "https://github.com/heronapp/hostflip"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Hostflip.app"
  binary "#{appdir}/Hostflip.app/Contents/Helpers/hostflip"

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
