cask "partitura" do
  version "0.12.0"
  sha256 "b02209448a819142054f79680a84af843f7cc5a995c48ff311a7c45b806b2515"

  url "https://jzmyrelamu5xuqoh.public.blob.vercel-storage.com/releases/macos/partitura-v#{version}.dmg"
  name "Partitura"
  desc "AI agent orchestration platform - conduct your orchestra of AI developers"
  homepage "https://partitura-ai.com"

  depends_on formula: "tmux"

  livecheck do
    url "https://www.partitura-ai.com/api/releases/latest"
    strategy :json do |json|
      json.dig("macos", "version")&.gsub(/\Av|\.+\z/, "")
    end
  end

  app "Partitura.app"

  zap trash: [
    "~/Library/Application Support/Partitura",
    "~/Library/Preferences/com.partitura.app.plist",
    "~/Library/Caches/com.partitura.app",
    "~/Library/Saved Application State/com.partitura.app.savedState",
  ]
end
