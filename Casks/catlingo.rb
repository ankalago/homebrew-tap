cask "catlingo" do
  version "0.1.44"
  sha256 "785bf9267e2f20d715a9a3b2c72e3473545af3d911c9ec7a6fa8ef8505f11a7d"

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
