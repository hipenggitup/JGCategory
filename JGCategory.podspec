Pod::Spec.new do |s|
  s.name             = "JGCategory"
  s.version          = "0.2.0"
  s.summary          = "JGCategory spec"
  s.description      = <<-DESC
                       Private Podspec

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/hipenggitup/JGCategory"
  s.license          = 'MIT'
  s.author           = { "sunhaipeng" => "sunhaipeng@jingge.cc" }
  s.source           = { :git => "https://github.com/hipenggitup/JGCategory.git", :tag => "0.2.0" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.subspec 'JGCategory' do |commonTools|
      commonTools.source_files = 'Pod/Classes/JGCategory/**/*'
      commonTools.public_header_files = 'Pod/Classes/JGCategory/**/*.h'
  end
  s.resource_bundles = {
    'JGCategory' => ['Pod/Assets/*.png']
  }
end
