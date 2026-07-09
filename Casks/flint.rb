cask "flint" do
  version "0.1.3"
  sha256 "a80730516c6460629b00672877168df2b9067e9c242b4371237e7c6eed478e7e"

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
