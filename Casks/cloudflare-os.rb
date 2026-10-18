cask "cloudflare-os" do
  version "0.1.3"
  sha256 "0e9c17502b9fcf43b942f7c8499153395d84e7719cf613a4b1ec0bc1c1c79dcf"

  url "https://github.com/ankalago/homebrew-tap/releases/download/cloudflare-os-v#{version}/CloudflareOS-macOS.zip"
  name "Cloudflare OS"
  desc "Unofficial desktop build of Cloudflare OS that runs locally"
  homepage "https://github.com/ankalago/homebrew-tap"

  depends_on arch: :arm64

  app "Cloudflare OS.app"

  preflight do
    system_command "/usr/bin/pkill",
                   args: ["-f", "Cloudflare OS.app"],
                   sudo: false
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Cloudflare OS.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Cloudflare OS",
  ]
end
