# typed: strict
# frozen_string_literal: true

cask "partitura" do
  version "2.5.2"
  sha256 :no_check

  # Releases live on GitHub Releases (private repo) and are streamed through the
  # site's authenticated download proxy. The asset is arch-suffixed; only Apple
  # Silicon (arm64) is published today. `version` is kept current by `livecheck`
  # below, and sha256 is :no_check because the proxied URL is resolved
  # dynamically — Homebrew can't pin a hash to a moving target.
  url "https://www.partitura-ai.com/api/updates/download?asset=partitura-v#{version}-arm64.dmg&tag=v#{version}",
      verified: "partitura-ai.com/"
  name "Partitura"
  desc "AI agent orchestration platform - conduct your orchestra of AI developers"
  homepage "https://partitura-ai.com/"

  livecheck do
    url "https://www.partitura-ai.com/api/releases/latest"
    strategy :json do |json|
      # /api/releases/latest returns assets grouped by platform as an ARRAY.
      json.dig("macos", 0, "version")&.gsub(/\Av|\.+\z/, "")
    end
  end

  # Apple Silicon only — no x86_64 DMG is built yet.
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Partitura.app"

  zap trash: [
    "~/Library/Application Support/Partitura",
    "~/Library/Caches/com.partitura.app",
    "~/Library/Preferences/com.partitura.app.plist",
    "~/Library/Saved Application State/com.partitura.app.savedState",
  ]
end
