cask "cloudflare-os" do
  version "0.1.9"
  sha256 "811641dfa31fa57fe95e8517a3ae26b5b7495b071c2d6fdee003ac2ae03d41db"

  url "https://github.com/ankalago/homebrew-tap/releases/download/cloudflare-os-v#{version}/CloudflareOS-macOS.zip"
  name "Impuestos"
  desc "Unofficial desktop build of Cloudflare OS that runs locally"
  homepage "https://github.com/ankalago/homebrew-tap"

  depends_on arch: :arm64

  app "Impuestos.app"

  # Homebrew 7 install steps: quitting a copy that is not running is not an error, and the
  # quarantine is cleared because the app has no Developer ID.
  preflight_steps do
    terminate_process "Impuestos.app", match: :full
  end

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Impuestos.app"]
  end

  zap trash: [
    "~/Library/Application Support/Cloudflare OS",
    "~/Library/Preferences/io.github.ankalago.cloudflare-os.plist",
    "~/Library/Saved Application State/io.github.ankalago.cloudflare-os.savedState",
  ]
end
