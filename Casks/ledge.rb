cask "ledge" do
  version "1.2.3"
  sha256 "66c386edb64558b6cbef94813348655dd087452e43c6fd5ca5005123f862d348"

  url "https://github.com/egemertbalcik/Ledge/releases/download/v#{version}/Ledge-#{version}.dmg"
  name "Ledge"
  desc "Notch app that shows music, timers, calendar and weather on the MacBook notch"
  homepage "https://ledgeapp.dev/"

  livecheck do
    url "https://github.com/egemertbalcik/Ledge/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Ledge.app"

  uninstall quit: "com.egemert.ledge"

  # Notes (~/Library/Application Support/Ledge/Notes) is the user's own writing,
  # so zap leaves it alone and removes only the app's state, caches and settings.
  zap trash: [
    "~/Library/Application Support/Ledge/*.json*",
    "~/Library/Caches/com.egemert.ledge",
    "~/Library/HTTPStorages/com.egemert.ledge",
    "~/Library/HTTPStorages/com.egemert.ledge.binarycookies",
    "~/Library/Preferences/com.egemert.ledge.plist",
  ]
end
