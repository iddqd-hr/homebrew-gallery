cask "gallery-app" do
  version "20260424.3"
  sha256 "6d576fa9a7dcbc6eb9ee49d87a8c6ca3ad29c6a3a9e1447a0081f7983576765b"

  url "https://iddqd.blob.core.windows.net/gallery-releases/20260424.3/GalleryApp-d0c0cd9.dmg?se=2027-04-24T13%3A34Z&sp=r&sv=2026-02-06&sr=b&sig=dQB8KfcR0HTLPOIzzAmiZnvsuU5Bnbmhh4rKbtLrjLA%3D"
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
