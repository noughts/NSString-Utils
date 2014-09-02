Pod::Spec.new do |s|
  s.name         = "NSString+Utils"
  s.version      = "0.1.0"
  s.summary      = "NSString+Utils"
  s.homepage     = "https://github.com/noughts/NSString+Utils"
  s.author       = { "noughts" => "noughts@gmail.com" }
  s.source       = { :git => "https://github.com/noughts/NSString+Utils.git" }
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.platform = :ios
  s.requires_arc = true
  s.source_files = 'NSString+Utils/**/*.{h,m}'
end
