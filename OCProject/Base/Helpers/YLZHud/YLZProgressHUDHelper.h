//
//  YLZProgressHUDHelper.h
//  YLZ-Category-iOS
//
//  Created by stone on 2021/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZProgressHUDHelper : NSObject

+ (void)showErrorSvg:(NSString *)errorMsg;
+ (void)showInfoSvg:(NSString *)msg;
+ (void)showSuccessSvg:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
