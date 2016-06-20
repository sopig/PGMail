Pod::Spec.new do |s|
  s.name         = "PGMail"
  s.version      = "0.0.1"
  s.summary      = "OpenSSL framework的封装"
  s.description  = <<-DESC
                   如何使用，请参见sopig.cc
                   DESC

  s.homepage     = "https://github.com/sopig/PGMail.git"
  
  s.license      = "MIT"
  
  s.author             = { "张正超" => "chay0103@163.com" }

  s.requires_arc = true
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/sopig/PGMail.git" }

  
  s.source_files = 'Classes/**/PGMailSMTP.h'
  s.public_header_files = "Classes/**/PGMailSMTP.h"
  s.vendored_libraries = 'libPGMail.a'
  #s.resource = 'Classes/**/*.plist','Classes/**/*.pem'


end
