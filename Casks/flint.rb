cask "flint" do
  version "0.1.2"
  sha256 "4895a5e80407d2aa7702e4037fa73d4a39e228bd1d0553e3864b02ee224a8a49"

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
