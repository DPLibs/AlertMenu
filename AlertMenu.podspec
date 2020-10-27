Pod::Spec.new do |s|
  s.name             = 'AlertMenu'
  s.version          = '1.0.1'
  s.summary          = 'Alert menu'
  s.description      = 'Library for work with UIAlertControllerView'
  s.homepage         = 'https://github.com/DPLibs/AlertMenu'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dmitriy Polyakov' => 'dmitriyap11@gmail.com' }
  s.source           = { :git => 'https://github.com/DPLibs/AlertMenu.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'AlertMenu/**/*'
  s.swift_version = '5.0'
  s.resource_bundle = { 'Localization' => ['AlertMenu/Localization/*.lproj/*.strings'] }
end
