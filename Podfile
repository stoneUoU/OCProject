# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'
source 'https://github.com/CocoaPods/Specs.git'
source 'https://i58yaw.edtsoft.com/gjybfwpt/hsa-ios/HSARepo.git'
platform :ios, '11.0'

flutter_application_path = '../hi_flutter_module/'

load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

post_install do |installer|
  flutter_post_install(installer)
end

target 'OCProject' do
  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!   use_frameworks会造成主工程取不到 main bundle

  # Pods for OCProject

  # 第三方组件
  pod 'ZSCodeUtil', '0.1.0'
  pod 'Masonry', '1.1.0'
  pod 'AFNetworking','4.0.1'
  pod 'lottie-ios', '2.5.2'   #OC版
  pod 'MJRefresh', '3.2.0'
  pod 'Toast', '4.0.0'
  pod 'SDWebImage', '5.1.1'
  pod 'SVProgressHUD', '2.2.5'
  pod 'MBProgressHUD', '~> 1.1.0'
  pod 'YYKit', '1.0.9'
  pod 'IQKeyboardManager', '6.5.6'
  pod 'Aspects', '1.4.1'
  pod 'MJExtension', '3.2.1'
  pod 'UITableView+FDTemplateLayoutCell', :git => 'https://github.com/forkingdog/UITableView-FDTemplateLayoutCell.git', :tag => '1.7.beta'
  pod 'JXPagingView/Pager'
  #打正式包得把下面三个库给注释：  若adhoc包中包含Reveal-SDK，则不要勾选Rebuild from Bitcode
  pod 'Reveal-SDK','~>4', :configurations => ['Debug']
  
#  pod 'RongCloudOpenSource/IMKit','5.0.0'           # IMKit
#  pod 'RongCloudOpenSource/Sight','5.0.0'           # 小视频
#  pod 'RongCloudOpenSource/RongSticker','5.0.0'     # 表情
#  pod 'RongCloudOpenSource/IFly','5.0.0'            # 语音输入
#  pod 'RongCloudOpenSource/ContactCard','5.0.0'     # 名片
#  pod 'RongCloudOpenSource/LocationKit','5.2.3'     # 地图Kit 注意：5.2.3(含)版本以后才支持 pod
#
#  pod 'RongCloudOpenSource/RongCallKit','5.0.0'     # CallKit

  install_all_flutter_pods(flutter_application_path)
  
end
