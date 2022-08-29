//
//  HSAPlugins.h
//  HSAPlugin
//
//  Created by stone on 2022/8/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HSAPlugins : NSObject

+ (void)fetchSwitch:(void(^)(BOOL isSwitch))handle;

+ (void)excuteURL:(void(^)(NSString *str))handle;

@end

NS_ASSUME_NONNULL_END
