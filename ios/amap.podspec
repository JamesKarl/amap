#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'amap'
  s.version          = '0.0.1'
  s.summary          = 'A wrapper of AMap for both Android and iOS'
  s.description      = <<-DESC
A wrapper of AMap for both Android and iOS
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'AMap3DMap', '6.9.0'
  s.dependency 'MJExtension', '3.1.1'
  s.static_framework = true

  s.ios.deployment_target = '8.0'
end

