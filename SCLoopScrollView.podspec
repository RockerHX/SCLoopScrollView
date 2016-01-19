#
#  Be sure to run `pod spec lint SCLoopScrollView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "SCLoopScrollView"
  s.version      = "0.5.2"
  s.summary      = "A View Can Infinite Loop Scroll."
  s.homepage     = "https://github.com/shicang1990/SCLoopScrollView"
  s.screenshots  = "http://i1.tietuku.com/7db519b122670a90.gif"
  s.license      = "MIT"
  s.author       = { "ShiCang" => "shicang1990@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/shicang1990/SCLoopScrollView.git", :tag => s.version }
  s.source_files = "Classes/**/*.{h,m}"
  s.requires_arc = true

end
