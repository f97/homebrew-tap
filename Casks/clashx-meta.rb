cask "clashx-meta" do
  version "1.2.5"
  sha256 "10e564d28d1087126531cee6eda4292652f336eed8c269748a02f3e99a057634"

  url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"
  name "ClashX Meta"
  desc "Rule-based custom proxy with GUI based on Clash.Meta"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  livecheck do
    url "https://github.com/MetaCubeX/ClashX.Meta/releases"
    regex(%r{href=".*?/releases/tag/v?(\d+(?:\.\d+)+)"}i)
    strategy :page_match do |page, regex|
      page.scan(regex).flatten.uniq.sort
    end
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "ClashX Meta.app"

  uninstall delete:    [
              "/Library/LaunchDaemons/com.metacubex.ClashX.ProxyConfigHelper.plist",
              "/Library/PrivilegedHelperTools/com.metacubex.ClashX.ProxyConfigHelper",
            ],
            launchctl: "com.metacubex.ClashX.ProxyConfigHelper",
            quit:      "com.metacubex.ClashX"

  zap trash: [
    "~/Library/Application Support/com.metacubex.ClashX.meta",
    "~/Library/Caches/com.metacubex.ClashX.meta",
    "~/Library/Logs/ClashX Meta",
    "~/Library/Preferences/com.metacubex.ClashX.meta.plist",
  ]
end