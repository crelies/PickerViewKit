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
  s.summary           = 'Model-based approach to easily setup your UIPickerView\'s and provide data for them'

  s.description       = <<-DESC
PickerViewKit makes it really simple to setup your picker views. You don't need to care about implementing a data source and delegate yourself. Just focus on creating your columns, rows and row models. Easily update the column(s) or rows of your picker view using a manager instance. The manager updates the data source for you and reloads the column(s).
                       DESC

  s.homepage          = 'https://github.com/crelies/PickerViewKit'
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.author            = { 'Christian Elies' => 'chris.elies13@gmail.com' }
  s.source            = { :git => 'https://github.com/crelies/PickerViewKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.ios.source_files = 'PickerViewKit/Classes/**/*'
  s.ios.framework = 'UIKit'
end
