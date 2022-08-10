//
//  HSAExampleHelper.h
//  OCProject
//
//  Created by stone on 2022/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HSAExampleHelper : NSObject

//公开属性：
@property (nonatomic, copy) NSString *publicString;
/**
 公开的实例方法：
 @param logicId 业务逻辑id
 */
- (void)publicInstanceMethod:(NSString *)logicId;
/**
 公开的类方法：
 @param logicId 业务逻辑id
 */
+ (void)publicClassMethod:(NSString *)logicId;

@end

NS_ASSUME_NONNULL_END
