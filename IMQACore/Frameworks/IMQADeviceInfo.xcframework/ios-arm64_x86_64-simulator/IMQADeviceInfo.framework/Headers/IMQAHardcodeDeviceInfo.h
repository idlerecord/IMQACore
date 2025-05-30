//
//  IMQAHardcodeDeviceInfo.h
//  FSAPMSDK
//
//  Created by Hunta on 2024/10/22.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMQAHardcodeDeviceInfo : NSObject

#pragma mark - Life Cycle
/**
 硬编码对象
 
 @return IMQAHardcodeDeviceInfo
 */
+ (nonnull IMQAHardcodeDeviceInfo *)machineHardcodedDeviceInfo;

/**
 禁止调用 init 方法
 
 @return IMQAHardcodeDeviceInfo
 */
- (nonnull instancetype)init NS_UNAVAILABLE;

/**
 禁止调用 init 方法
 
 @return IMQAHardcodeDeviceInfo
 */
+ (nonnull instancetype)new NS_UNAVAILABLE;

#pragma mark - Public Method
/**
 获取设备名称

 @return NSString
 */
- (const NSString *)getDeviceName;

/**
 获取 CPU 名称
 
 @return NSString
 */
- (const NSString *)getCPUName;

/**
 获取 CPU 频率

 @return NSUInteger
 */
- (NSUInteger)getCPUFrequency;

/**
 获取 协处理器 名称

 @return NSString
 */
- (const NSString *)getCoprocessorName;

/**
 获取电池容量

 @return NSUInteger
 */
- (NSUInteger)getBatteryCapacity;

/**
 获取电池电压

 @return CGFloat
 */
- (CGFloat)getBatteryVoltage;

/**
 获取屏幕尺寸

 @return CGFloat 英寸
 */
- (CGFloat)getScreenSize;

/**
 获取屏幕 PPI

 @return NSUInteger
 */
- (NSUInteger)getPPI;

@end

NS_ASSUME_NONNULL_END
