cask "catlingo" do
  version "0.1.49"
  sha256 "febe90f00b6858954276511254dad2f625ee49033a3fd0df0da7a5e04b8b10db"

  url "https://github.com/ankalago/homebrew-tap/releases/download/v#{version}/CatLingo-macOS.zip"
  name "CatLingo"
  desc "Native macOS AI translation, proofreading, and context-aware autocomplete assistant"
  homepage "https://github.com/ankalago/homebrew-tap"

  app "CatLingo.app"

  preflight do
    system_command "/usr/bin/pkill",
                   args: ["-f", "CatLingo.app"],
                   sudo: false
    system_command "/usr/bin/pkill",
                   args: ["-f", "LingoType.app"],
                   sudo: false
    system_command "/bin/rm",
                   args: ["-rf", "#{appdir}/LingoType.app"],
                   sudo: false
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CatLingo.app"],
                   sudo: false
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/CatLingo.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/CatLingo",
    "~/Library/Application Support/@copiloto/desktop",
    "~/Library/Services/Traducir con CatLingo.workflow",
    "~/Library/Services/Traducir con LingoType.workflow",
  ]
end
