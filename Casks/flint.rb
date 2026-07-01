cask "flint" do
  version "0.1.1"
  sha256 "a142f50a2c03b6723efe6290b713a8fdd7fbfd058bb6535626e45c4107160d6f"

  url "https://github.com/chutiponh/flint/releases/download/v#{version}/Flint-#{version}.dmg"
  name "Flint"
  desc "Menubar toolkit of offline developer tools (encode, format, hash, diff)"
  homepage "https://github.com/chutiponh/flint"

  depends_on macos: :sonoma

  app "Flint.app"

  # This build is not notarized. Strip the quarantine flag so the app opens without
  # the "unverified developer" prompt. Remove once releases are signed + notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Flint.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Flint",
    "~/Library/Caches/dev.chutipon.flint",
    "~/Library/Preferences/dev.chutipon.flint.plist",
  ]
end
