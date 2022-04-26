//
//  YLZFunctionModel.h
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZFunctionModel : NSObject

@property (nonatomic, assign) BOOL topFillet;

@property (nonatomic, assign) BOOL bottomFillet;

@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, strong) NSString *functionName;

@property (nonatomic, strong) NSString *subName;


@end

NS_ASSUME_NONNULL_END
