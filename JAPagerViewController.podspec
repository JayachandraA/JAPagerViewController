#
# Be sure to run `pod lib lint JAPagerViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JAPagerViewController'
  s.version          = '1.0'
  s.summary          = 'A simple pager based view controller to display sequence of views in single view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'JAPagerViewController is a simple pager based view controller to display sequence of views in single view.'

  s.homepage         = 'https://github.com/JayachandraA/JAPagerViewController'
  s.screenshots     = 'https://github.com/JayachandraA/JAPagerViewController/blob/development/Example/pager1.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JayachandraA' => 'ajchandra15@gmail.com' }
  s.source           = { :git => 'https://github.com/JayachandraA/JAPagerViewController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ajchandra15'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'
  s.source_files = 'JAPagerViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JAPagerViewController' => ['JAPagerViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
