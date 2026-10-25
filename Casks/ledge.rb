cask "ledge" do
  version "1.2.4"
  sha256 "e6ac20e5bca4e933f00b42fa7899c01c33dcda9d7f5561d84676269ba01f0126"

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
