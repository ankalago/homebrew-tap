cask "cloudflare-os" do
  version "0.1.6"
  sha256 "a61243e9e2620cf610e9d35f9a49aeeee36b3382651ede8a5dba43f1308fb53f"

  url "https://github.com/ankalago/homebrew-tap/releases/download/cloudflare-os-v#{version}/CloudflareOS-macOS.zip"
  name "Cloudflare OS"
  desc "Unofficial desktop build of Cloudflare OS that runs locally"
  homepage "https://github.com/ankalago/homebrew-tap"

  depends_on arch: :arm64

  app "Cloudflare OS.app"

  # Homebrew 7 install steps: quitting a copy that is not running is not an error, and the
  # quarantine is cleared because the app has no Developer ID.
  preflight_steps do
    terminate_process "Cloudflare OS.app", match: :full
  end

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Cloudflare OS.app"]
  end

  zap trash: [
    "~/Library/Application Support/Cloudflare OS",
    "~/Library/Preferences/io.github.ankalago.cloudflare-os.plist",
    "~/Library/Saved Application State/io.github.ankalago.cloudflare-os.savedState",
  ]
end
