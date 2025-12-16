cask "partitura" do
  version "1.0.0-beta-1"
  sha256 "5f2abbf8448467b5fd1813f95d08d71b3de7c11d0b290a31bd3ae355b6a0171b"

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
