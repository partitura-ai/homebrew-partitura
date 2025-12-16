cask "partitura" do
  version "1.0.0-beta-2"
  sha256 "3e759dd0e3d7b8fff84047f1ff4a536b37604979f5f7e4f50020da194c19024e"

  url "https://jzmyrelamu5xuqoh.public.blob.vercel-storage.com/releases/macos/partitura-v#{version}.dmg"
  name "Partitura"
  desc "AI agent orchestration platform - conduct your orchestra of AI developers"
  homepage "https://partitura-ai.com"

  depends_on formula: "tmux"

  livecheck do
    url "https://partitura-ai.com/api/latest-version"
    strategy :json do |json|
      json["version"]
    end
  end

  app "Partitura.app"

  zap trash: [
    "~/Library/Application Support/partitura",
    "~/Library/Preferences/com.partitura.app.plist",
    "~/Library/Caches/com.partitura.app",
    "~/Library/Saved Application State/com.partitura.app.savedState",
  ]
end
