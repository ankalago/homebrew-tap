cask "lingotype" do
  version "0.1.32"
  sha256 "3559f29908ce36171c809a0c96f32bb65007120e3f23925d84ca9fc11ce0ed4d"

  url "https://github.com/ankalago/homebrew-tap/releases/download/v#{version}/LingoType-macOS.zip"
  name "LingoType"
  desc "Native macOS AI translation, proofreading, and context-aware autocomplete assistant"
  homepage "https://github.com/ankalago/homebrew-tap"

  app "LingoType.app"

  preflight do
    system_command "/usr/bin/pkill",
                   args: ["-f", "LingoType.app"],
                   sudo: false
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/LingoType.app"],
                   sudo: false
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/LingoType.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/@copiloto/desktop",
    "~/Library/Services/Traducir con LingoType.workflow",
  ]
end
