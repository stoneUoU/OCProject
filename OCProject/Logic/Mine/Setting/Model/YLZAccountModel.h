//
//  YLZAccountModel.h
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZAccountModel : NSObject

@property (nonatomic, copy) NSString *nameString;

@property (nonatomic, copy) NSString *picString;

@property (nonatomic, copy) NSString *phoneString;

@property (nonatomic, assign) BOOL checked;

@end

NS_ASSUME_NONNULL_END
