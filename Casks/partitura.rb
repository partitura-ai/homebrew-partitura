cask "partitura" do
  version "0.7.0"
  sha256 "0a0c8e454513de0c407355ec886cf81974916b8c30b60e6dbb9a6d780fb0f89a"

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
