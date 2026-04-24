cask "gallery-app" do
  version "20260424.4"
  sha256 "c8d3599b5e7d1d3bb15d410d9e99d2b24e58cbec856e2b33fe47fd0556a6c80d"

  url "https://iddqd.blob.core.windows.net/gallery-releases/20260424.4/GalleryApp-v0.1.1.dmg?se=2027-04-24T19%3A18Z&sp=r&sv=2026-02-06&sr=b&sig=otIQL3d0Y84ZVvY%2F%2F5hJDtvqNRH8s%2FNaG7Mpd%2Frn99E%3D"
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
