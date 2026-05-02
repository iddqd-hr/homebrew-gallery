cask "gallery-app" do
  version "20260502.1"
  sha256 "a28d9324a8c41e9fb89237547a6a2c7880b612d714360e7c2d7f75de65103732"

  url "https://iddqd.blob.core.windows.net/gallery-releases/20260502.1/GalleryApp-v0.1.2.dmg?se=2027-05-02T07%3A10Z&sp=r&sv=2026-02-06&sr=b&sig=rzfzlDkSlQ0MW5X6WfaiEk%2Fjeo9Qg2K3mJS%2B0pkGDhE%3D"
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
