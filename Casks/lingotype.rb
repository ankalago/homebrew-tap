cask "lingotype" do
  version "0.1.28"
  sha256 "d42b8b59d6303ca6eb74003e81a72bca0aa34158c9dbe371a33322041b13941b"

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
