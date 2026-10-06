cask "proscenium" do
  version "1.0.1"
  sha256 "37f3f15edf518712ab497a988f1b541c50108b39d3fa88f38c0ee91866fa0320"

  url "https://github.com/proscenium-app/proscenium/releases/download/v#{version}/Proscenium_#{version}_universal.dmg"
  name "Proscenium"
  desc "Write stage plays in industry-standard format"
  homepage "https://proscenium.ink/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself, so `brew upgrade` leaves it to do so.
  auto_updates true
  depends_on macos: :sonoma

  app "Proscenium.app"

  # What the app keeps beside itself: preferences, version history, the debug
  # log, WebKit's own storage. Never the Plays folder, and never the iCloud
  # Drive container (~/Library/Mobile Documents/iCloud~org~habiby~proscenium):
  # those hold the writer's plays.
  zap trash: [
    "~/Library/Application Support/org.habiby.proscenium",
    "~/Library/Caches/org.habiby.proscenium",
    "~/Library/HTTPStorages/org.habiby.proscenium",
    "~/Library/Preferences/org.habiby.proscenium.plist",
    "~/Library/Saved Application State/org.habiby.proscenium.savedState",
    "~/Library/WebKit/org.habiby.proscenium",
  ]
end
