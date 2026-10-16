cask "lingotype" do
  version "0.1.0"
  sha256 "8d5456c15e8236a5dd32151fbd38e2c860b791e084e948ee32937de78ef232ed"

  url "https://github.com/ankalago/homebrew-tap/releases/download/v#{version}/LingoType-macOS.zip"
  name "LingoType"
  desc "Native macOS AI translation, proofreading, and context-aware autocomplete assistant"
  homepage "https://github.com/ankalago/homebrew-tap"

  app "LingoType.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/LingoType.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/@copiloto/desktop",
    "~/Library/Services/Traducir con LingoType.workflow",
  ]
end
