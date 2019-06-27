#
# Be sure to run `pod lib lint NBLTreeNode.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NBLTreeNode'
  s.version          = '0.1.0'
  s.summary          = 'Object-C。树相关的功能。'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 树的遍历，移动等。
                       DESC

  s.homepage         = 'https://github.com/yjh4866/NBLTreeNode'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '杨建红' => 'yjh4866@163.com' }
  s.source           = { :git => 'https://github.com/yjh4866/NBLTreeNode.git', :tag => s.version.to_s }
  s.social_media_url = 'https://blog.csdn.net/yjh4866'

  s.ios.deployment_target = '9.0'

  s.source_files = 'NBLTreeNode/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NBLTreeNode' => ['NBLTreeNode/Assets/*.png']
  # }

  s.public_header_files = 'NBLTreeNode/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
