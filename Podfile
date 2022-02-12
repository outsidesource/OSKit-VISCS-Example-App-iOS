# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'VISCSExample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  $branch = 'main'
  
  # Pods for VISCSExample
  pod 'OSKit/Build+Resolver', :git => 'https://github.com/outsidesource/OSKit-iOS', :branch => $branch
  pod 'OSKit/Log+Rx', :git => 'https://github.com/outsidesource/OSKit-iOS', :branch => $branch
  pod 'OSKit/Log+VISCS', :git => 'https://github.com/outsidesource/OSKit-iOS', :branch => $branch
  pod 'OSKit/VISCS+Rx', :git => 'https://github.com/outsidesource/OSKit-iOS', :branch => $branch
  
#  pod 'OSKit/Build+Resolver', :path => '../OSKit-iOS'
#  pod 'OSKit/Log+Rx', :path => '../OSKit-iOS'
#  pod 'OSKit/Log+VISCS', :path => '../OSKit-iOS'
#  pod 'OSKit/VISCS+Rx', :path => '../OSKit-iOS'
  
  # We are using XCoordinator to implement VISCS Coordinator component - VISCS does not specify a Coordinator implementation
  pod 'XCoordinator'
  
  target 'VISCSExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'VISCSExampleUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  
  # Remove warnings for deployment target
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
  
end
