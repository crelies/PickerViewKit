#
# Be sure to run `pod lib lint PickerViewKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.cocoapods_version = '>= 1.4.0'
  s.swift_version     = '4.0'
  
  s.name              = 'PickerViewKit'
  s.version           = '0.1.0'
  s.summary           = 'A short description of PickerViewKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description       = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage          = 'https://github.com/crelies/PickerViewKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.author            = { 'Christian Elies' => 'chris.elies13@gmail.com' }
  s.source            = { :git => 'https://github.com/crelies/PickerViewKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.ios.source_files = 'PickerViewKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PickerViewKit' => ['PickerViewKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.ios.framework = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
