cask "lingotype" do
  version "0.1.29"
  sha256 "ec529235c09407a015aa519ba896e9f111e1cdea03e9fc4c0e01e3220a271a6b"

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
