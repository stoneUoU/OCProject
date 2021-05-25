//
//  YLZWeakProxy.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.s
//

#import <Foundation/Foundation.h>

@interface YLZWeakProxy : NSProxy

@property (nullable, nonatomic, weak, readonly) id target;
/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
- (instancetype)initWithTarget:(id)target;

/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
+ (instancetype)proxyWithTarget:(id)target;

@end
