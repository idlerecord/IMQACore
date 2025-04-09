#
# Be sure to run `pod lib lint IMQACore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "IMQACore"
  s.version = "1.0.12.5"
  s.summary          = "IMQA iOS Core SDK"
  s.description      = "IMQA iOS Core SDK build한 Frameworks만 포함"
  s.homepage         = "https://github.com/your-repo"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Hunta" => "hunta@onycom.com" }
  s.source           = { :git => "https://github.com/idlerecord/IMQACore.git", :tag => s.version.to_s }

  s.ios.deployment_target = "13.0"

  # **1️⃣ 没有源代码，去掉 `source_files`**
  # s.source_files = "Sources/**/*.{h,m,swift}"  ⛔️ 删除这一行

  # **2️⃣ 依赖的 Frameworks**
  s.vendored_frameworks = [
    "IMQACore/Frameworks/IMQACollectDeviceInfo.xcframework",
    "IMQACore/Frameworks/IMQACommonInternal.xcframework",
    "IMQACore/Frameworks/IMQACore.xcframework",
    "IMQACore/Frameworks/IMQAObjCUtilsInternal.xcframework",
    "IMQACore/Frameworks/IMQAOtelInternal.xcframework",
    "IMQACore/Frameworks/KSCrash.xcframework",
    "IMQACore/Frameworks/MMKV.xcframework",
    "IMQACore/Frameworks/MMKVCore.xcframework",
    "IMQACore/Frameworks/OpenTelemetryApi.xcframework",
    "IMQACore/Frameworks/OpenTelemetrySdk.xcframework",
    "IMQACore/Frameworks/SwiftProtobuf.xcframework"
  ]

  # **3️⃣ 依赖其他 CocoaPods 库（如果有）**
#  s.dependency "OpenTelemetryApi"
#  s.dependency "OpenTelemetrySdk"
#  s.dependency "KSCrash", "~> 1.15.0"
#  s.dependency "MMKV"

  # **4️⃣ 资源文件 (如果 Framework 内部需要)**
#  s.resource_bundles = {
#  "IMQACoreResources" => ["Resources/*.xcprivacy", "Resources/*.bundle"]
#  }

  # **5️⃣ 额外的编译设置**
#  s.pod_target_xcconfig = {
#    "FRAMEWORK_SEARCH_PATHS" => '"$(PODS_ROOT)/Frameworks"',
#    "OTHER_LDFLAGS" => "-ObjC"
#  }

s.pod_target_xcconfig = {
'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'x86_64 armv7 arm64',
'VALID_ARCHS' => 'x86_64 armv7 arm64',
}
s.user_target_xcconfig = {
'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'x86_64 armv7 arm64',
'VALID_ARCHS' => 'x86_64 armv7 arm64',
}
end
