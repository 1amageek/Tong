Pod::Spec.new do |s|

  s.name         = "Tong"
  s.version      = "0.0.1"
  s.summary      = ""
  s.description  = <<-DESC
  Tong is library for using ElasticSearch with Swift.
  TypeSafe can handle Type to retrieve.
                   DESC
  s.homepage     = "https://github.com/1amageek/Tong"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "1amageek" => "tmy0x3@icloud.com" }
  s.social_media_url   = "http://twitter.com/1amageek"
  s.platform     = :ios
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/1amageek/Tong.git", :tag => "#{s.version}" }
  s.source_files  = "Tong/**/*.swift"
  s.public_header_files = "Tong/**/*.h"
  s.requires_arc = true
  s.dependency "APIKit"
  s.dependency "ElastiQ"

end
