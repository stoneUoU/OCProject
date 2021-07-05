//
//  YLZReviewingModel.h
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZReviewingModel : NSObject

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, copy) NSString *contentString;

@property (nonatomic, copy) NSString *picString;

@property (nonatomic, copy) NSString *timeString;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) BOOL isPass;

@end

NS_ASSUME_NONNULL_END
