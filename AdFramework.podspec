
# Created by: Waleed
# Author: Waleed
# Date: 07.07.2020

# Basic Commands for Podspec
# pod lib create AdFramework.podspec
# pod lib lint AdFramework.podspec
# pod trunk push AdFramework.podspec

Pod::Spec.new do |s|
  # Podspec Naming
  s.name             = 'AdFramework'
  s.version          = '0.0.4'
  s.summary          = 'AdFramework help connects user to github for public data tasks'
  s.description      = 'AdFramework depends on AFNetworking to fetch public data about user and their repositories from github'
  
  # Podspec Configurations and Dependencies
  s.homepage         = 'https://github.com/waleedmahmood/AdFramework'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'waleed.mahmood41@gmail.com' => 'waleed.mahmood41@gmail.com' }
  s.source           = { :git => 'https://github.com/waleedmahmood/AdFramework.git', :tag => '0.0.4' }
  s.ios.deployment_target = '12.0'
  s.source_files = 'AdAptrFramework/**/*'
  s.frameworks = 'Foundation'
  s.dependency 'AFNetworking', '~> 4.0'
  
  # These following lines are for later reference for podspec basic documentation
  # e.g. when adding brindging-header configuration,
  # s.resource_bundles = {
  #   'AdFramework' => ['AdFramework/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
end
