cask "netnewswire" do
  on_monterey :or_older do
    version "6.1.4"
    sha256 "74d75b9e25c6adef06dbf01cd060771872769357448879809535f77493840bbb"

    livecheck do
      skip "Legacy version"
    end
  end
  on_ventura :or_newer do
    version "6.1.7"
    sha256 "6108dad6dc46725ffaf879a7d8c57673fbeaa27a8e55b6b6153426d5ffea39aa"

    livecheck do
      url :url
      regex(/^mac[._-]v?(\d+(?:\.\d+)+)(?:[._-]release)?$/i)
    end
  end

  url "https://github.com/Ranchero-Software/NetNewsWire/releases/download/mac-#{version}-release/NetNewsWire#{version}.zip",
      verified: "github.com/Ranchero-Software/NetNewsWire/"
  name "NetNewsWire"
  desc "Free and open-source RSS reader"
  homepage "https://netnewswire.com/"

  auto_updates true
  conflicts_with cask: "netnewswire@beta"
  depends_on macos: ">= :catalina"

  app "NetNewsWire.app"

  zap trash: [
    "~/Library/Application Scripts/com.ranchero.NetNewsWire-Evergreen",
    "~/Library/Application Scripts/com.ranchero.NetNewsWire-Evergreen.Subscribe-to-Feed",
    "~/Library/Application Support/NetNewsWire",
    "~/Library/Caches/com.ranchero.NetNewsWire-Evergreen",
    "~/Library/Containers/com.ranchero.NetNewsWire-Evergreen",
    "~/Library/Containers/com.ranchero.NetNewsWire-Evergreen.Subscribe-to-Feed",
    "~/Library/Group Containers/group.com.ranchero.NetNewsWire-Evergreen",
    "~/Library/Preferences/com.ranchero.NetNewsWire-Evergreen.plist",
    "~/Library/Saved Application State/com.ranchero.NetNewsWire-Evergreen.savedState",
    "~/Library/WebKit/com.ranchero.NetNewsWire-Evergreen",
  ]
end
