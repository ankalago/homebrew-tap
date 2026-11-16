cask "catlingo" do
  version "0.1.51"
  sha256 "d8b40b53809ba68b8ea51aa18068e2a9148049880a4d923558b0292383e13d5a"

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
