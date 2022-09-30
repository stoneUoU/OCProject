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

@property (nonatomic, copy) NSString *iconName;

@property (nonatomic, copy) NSString *functionName;

@property (nonatomic, copy) NSString *subName;

@property (nonatomic, copy) NSString *functionNameColor;

@property (nonatomic, assign) NSInteger fontSize;


@end

NS_ASSUME_NONNULL_END
