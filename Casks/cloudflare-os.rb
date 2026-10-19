cask "cloudflare-os" do
  version "0.1.14"
  sha256 "de87ef4d98822798439a0f8064fa96e69f856c8fe400ac8324b8faae1b7cd44c"

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
