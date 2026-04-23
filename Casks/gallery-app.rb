cask "gallery-app" do
  version "1.0.0"
  sha256 "PLACEHOLDER_SHA256"

  url "PLACEHOLDER_URL"
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
