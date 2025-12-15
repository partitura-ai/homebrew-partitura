cask "partitura" do
  version "1.0.0"
  sha256 "965bd3a451e4f46ebf7d8a5d72a4c0dc09e9dbfba2b9c96d34fc3e97790a7c5d"

  url "https://jzmyrelamu5xuqoh.public.blob.vercel-storage.com/releases/macos/partitura-v#{version}.dmg"
  name "Partitura"
  desc "AI agent orchestration platform - conduct your orchestra of AI developers"
  homepage "https://partitura-ai.com"

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
