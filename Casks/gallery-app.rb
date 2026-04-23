cask "gallery-app" do
  version "20260423.8"
  sha256 "85595903076c55636e64523935bcd98a2726d861663c40d280e9d35f1bdd01a0"

  url "https://iddqd.blob.core.windows.net/gallery-releases/20260423.8/GalleryApp-28ec081.dmg?se=2027-04-23T19%3A11Z&sp=r&sv=2022-11-02&sr=b&sig=mYflkc%2FFijYAvVcl8JnxgAVRDaNfKod9q4A6tGGY2XE%3D"
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
