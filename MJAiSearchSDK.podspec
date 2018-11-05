#
# Be sure to run `pod lib lint MJAiSearchSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MJAiSearchSDK'
  s.version          = '1.1.0'
  s.summary          = '明觉爱查询SDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/w1090485608/MJAiSearchSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '袁兴杨' => 'xingyang.yuan@dataenlighten.com' }
  s.source           = { :git => 'https://github.com/w1090485608/MJAiSearchSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

# s.source_files = 'MJAiSearchSDK/Classes/**/*'
  
s.resource_bundles = {
  'MJAiSearchSDK' => ['MJResources.bundle']
}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
s.dependency 'Masonry'
s.ios.vendored_frameworks = MJDataLib.framework,MJVinParseLib.framework,MJAreaSearchPartLib.framework,MJSearchPartLib.framework,MJSearchEPCPartLib.framework

end
