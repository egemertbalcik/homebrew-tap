cask "ledge" do
  version "1.2.5"
  sha256 "10d5fea5912802989c125bf504cba4bc7b360ce7ef0c56a8fec155d92a84e7a7"

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
