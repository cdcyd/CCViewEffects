#
#  Be sure to run `pod spec lint CCViewEffects.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CCViewEffects"
  s.version      = "1.1.0"
  s.summary      = "Rounded corners, borders, shadows"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "https://github.com/cdcyd/CCViewEffects"
  s.description  = <<-DESC
                        视图的圆角、边框、阴影一行代码完成设置
                     DESC

  s.author                  = { "cyd" => "1035060416@qq.com" }
  s.social_media_url        = "https://cdcyd.github.io/"
  s.ios.deployment_target   = "8.0"
  s.source                  = { :git => "https://github.com/cdcyd/CCViewEffects.git", :tag => "v1.1.0" }
  s.source_files            = 'ViewEffects'
  s.public_header_files     = 'ViewEffects/*.h'

  # s.resource       = "icon.png"
  # s.resources      = "Resources/*.png"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # s.framework      = "SomeFramework"
  # s.frameworks     = "SomeFramework", "AnotherFramework"
  # s.library        = "iconv"
  # s.libraries      = "iconv", "xml2"
  # s.requires_arc   = true
  # s.xcconfig       = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
