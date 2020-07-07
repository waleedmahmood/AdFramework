#
# Be sure to run `pod lib lint AdFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AdFramework'
  s.version          = '0.0.1'
  s.summary          = 'AdFramework help connects user to github for public data tasks'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'AdFramework depends on AFNetworking to fetch public data about user and their repositories from github'

  s.homepage         = 'https://github.com/waleedmahmood/AdFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'waleed.mahmood41@gmail.com' => 'waleed.mahmood41@gmail.com' }
  s.source           = { :git => 'https://github.com/waleed.mahmood41@gmail.com/AdFramework.git', :tag => '0.0.1' }
  

  s.ios.deployment_target = '12.0'

  s.source_files = 'AdAptrFramework/**/*'
  
  # s.resource_bundles = {
  #   'AdFramework' => ['AdFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'
  s.dependency 'AFNetworking', '~> 4.0'
end
