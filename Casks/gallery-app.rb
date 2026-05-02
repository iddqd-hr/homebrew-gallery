cask "gallery-app" do
  version "20260502.2"
  sha256 "bbc303598910e4497e71b3811ed4e915751560c65399546c6365b8c2ccf68611"

  url "https://iddqd.blob.core.windows.net/gallery-releases/20260502.2/GalleryApp-v0.1.3.dmg?se=2027-05-02T11%3A57Z&sp=r&sv=2026-02-06&sr=b&sig=Gc2Xms9j%2FUcH4nKogMCihNXNBLPiNHgQGciSxAis8zo%3D"
  name "Gallery App"
  desc "Photo organization app with face clustering, scene detection, and EXIF tagging"
  homepage "https://dev.azure.com/iddqd-hr/claudegallery"

  depends_on macos: ">= :ventura"

  app "gallery_app.app"

  postflight do
    # Remove quarantine flag (app is unsigned)
    system_command "/usr/bin/xattr",
     args: ["-cr", "#{appdir}/gallery_app.app"],
     sudo: false
  end

  zap trash: [
    "~/Library/Application Support/hr.iddqd.galleryApp",
  ]
end
