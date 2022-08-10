//
//  HSAExampleHelper.m
//  OCProject
//
//  Created by stone on 2022/7/24.
//

#import "HSAExampleHelper.h"

@interface HSAExampleHelper()
//私有属性：
@property (nonatomic, assign) NSInteger privateInt;
//私有的实例方法：
- (void)privateInstanceMethod;
//私有的类方法：
+ (void)privateClassMethod;
@end

@implementation HSAExampleHelper

- (void)publicInstanceMethod:(NSString *)logicId {
};

+ (void)publicClassMethod:(NSString *)logicId {
};

- (void)privateInstanceMethod {
};

+ (void)privateClassMethod {
};

@end
