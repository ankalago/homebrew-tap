cask "cloudflare-os" do
  version "0.1.11"
  sha256 "34916797176597ff1f848710238a112426cc830f3153e1a4cb88f70afdba4445"

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
